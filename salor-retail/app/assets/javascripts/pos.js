/*
  All POS Screen functionality is through here now.
 */
var POS = function () {
  var self = this;
  this.pos_container = null;
  this.order_items_container = null;
  this.control_panel = null;
  this.seen_items = {};
  this.dont_focus_sku_input = false;
  /*
    This function is where everything gets setup.
   */
  this.documentReady = function () {
    self.pos_container = $('#pos_container');
    var off = self.pos_container.offset();
    self.pos_container.offset({top: off.top + 20});
    // i.e. we want the container to be a little off
    self.pos_container.height($(window).height() - (self.pos_container.offset().top + 20));
    self.drawOrderItemsContainer();
    self.drawControlPanel();
    _set('order_dirty',true);
    setInterval(function () {
      if ( (
              !$('#cash_drop').is(":visible") && 
              !$('#complete_order').is(":visible") && 
              !$('#inplaceedit-div').is(":visible") && 
              !$('#search').is(":visible") &&
              !$('.void-order').is(":visible") &&
              !$('.ui-keyboard').is(":visible") && 
              !$('.salor-dialog').is(":visible") &&
              !$('.floating-input').is(":visible")
            ) &&
        self.dont_focus_sku_input == false ) {
          focusInput($("#pos_sku_input"));
        } 
        if (_get('order_dirty')) {
          self.drawOrder(Order);
        }
    },250);
  }
  // Drawing the interface
  this.drawOrderItemsContainer = function () {
    var oic = shared.element("div",{id: "order_items_container"},'',self.pos_container);
    self.order_items_container = oic;
    oic.width(self.pos_container.width() * 0.75);
    oic.height(self.pos_container.height() * 0.95);  
  }
  this.drawControlPanel = function () {
    var cp = shared.element("div",{id: "pos_control_panel"},'',self.pos_container);
    var off = self.order_items_container.offset();
    var w = self.order_items_container.outerWidth() + 10;
    cp.offset({left:off.left + w, top: off.top});
    cp.width(self.pos_container.width() * 0.24);
    cp.height(self.pos_container.height() * 0.95);
    self.control_panel = cp;
    var t = shared.element('div', {id: 'order_total'},toCurrency(Order.total),cp);
    t.outerWidth(cp.outerWidth() - 20);
    var change = shared.element('div', {id: 'order_change'},toCurrency(0),cp);
    change.outerWidth(cp.outerWidth() - 20);
    change.mousedown(function () {
      var dlg = shared.draw.dialog(i18n.views.change,'change_recalculate');
      shared.helpers.center(dlg);
      shared.helpers.position_rememberable(dlg);
      var ttl = shared.element( 'div', {}, toCurrency( _get('order_total_was',$(this)) ) ,dlg);
      ttl.addClass('pos-total');
      var ch = shared.element('div',{id: 'recalc_change'}, toCurrency( Round(_get('pm_ttl',$(this)) - _get('order_total_was',$(this)),2) ),dlg);
      ch.addClass('pos-change');
      var inp = shared.element('input',{},'',dlg);
      inp.addClass('raised-input');
      // we have to focus on timeouts because the js code completes before the interface has drawn the element
      setTimeout(function () { inp.focus(); inp.select();},100);
      _set('order_total',_get('order_total_was',$(this)),inp );
      inp.keyup(function () {
        $('#recalc_change').html( toCurrency( Round(toFloat($(this).val()) - _get('order_total',$(this)),2) ) );
      });
    });
    var inp = shared.element('input',{id: 'pos_sku_input'},'',cp);
    inp.outerWidth(cp.outerWidth() - 20);
    inp.keypress(function (event) {
      if (event.which == '13' && !event.shiftKey) {
        self.findItem($(this).val());
      }
    });
    inp.focus(function () {
      self.dont_focus_sku_input = false;
    })
    var cp_buttons = shared.element('div',{id: 'pos_cp_buttons'},'',cp);
    cp_buttons.outerWidth(cp.outerWidth() - 20);
    
    for (var i = 0; i < PaymentMethods.length; i++) {
      var pm = PaymentMethods[i];
      var complete_in_x = shared.element('div',{id: 'complete_in_' + pm.internal_type},pm.name,cp_buttons);
      complete_in_x.outerWidth(cp_buttons.width() - 5);
      complete_in_x.addClass('payment-method');
      if (pm.internal_type.toLowerCase() == 'incash') {
        complete_in_x.addClass('complete_in_cash');
      } else if (pm.internal_type.toLowerCase() == 'ByCard') {
        complete_in_x.addClass('complete_in_card');
      } else  {
        complete_in_x.addClass('complete_in_x');
      }
      _set('payment_method',pm,complete_in_x);
      complete_in_x.mousedown(function () {
        var code = $('#pos_sku_input').val();
        if (code == '-') {
          _set('amount',0,$(this));
          $('#pos_sku_input').val('');
          $(this).html(_get('payment_method',$(this)).name);
          Order.payment_methods = self.collectPms(); // i.e. return the pms, not the pm_ttl
          console.log("Order.payment_methods = ",Order.payment_methods);
          self.saveOrder(true);
          return;
        }
        self.completeOrder($(this));
      });
    }
  }
  this.drawOrder = function (o) {
    var change = 0;
    var pm_ttl = 0;
    $.each($('.payment-method'),function (k,v) {
      var pm = _get('payment_method',$(v));
      $(v).html(pm.name);
      
    });
    $.each(o.payment_methods, function (k,v) {
      var id = '#complete_in_' + v.internal_type;
      if (v.amount) {
        pm_ttl = pm_ttl + v.amount;
        $(id).html(v.name + " " + toCurrency(v.amount) + "");
        _set('payment_method',v,$(id));
        _set('amount',v.amount,$(id));
      }
    });
    $('#order_total').html(toCurrency(Order.total));
    // we don't want to update the change until we've added new items,
    // this way, the change on the last order is still shown after
    // complete.
    if (Order.order_items.length > 0) {
      $('#order_change').html(toCurrency(Round(pm_ttl - Order.total,2)));
      _set('order_total_was',Order.total,$('#order_change'));
      _set('order_id_was',Order.id,$('#order_change'));
      _set('pm_ttl',pm_ttl,$('#order_change'));
    }
    self.drawOrderItems(Order.order_items);
    _set('order_dirty',false); // when we do something to the order, need to set it dirty
  }
  /* OrderItem work */
  this.drawOrderItems = function (order_items) {
    if ($('.floating-input').is(":visible")) {
      return;
    }
    self.order_items_container.html('');
    for (var index = 0; index < order_items.length; index++) {
      var order_item = order_items[index];
      order_item.index = index
      if (order_item.hidden != 1) {
        self.drawOrderItem(order_item,index);
      }
    }
  }
  this.drawOrderItem = function (order_item,index) {
    var id = "order_item_" + index;
    self.updateOrderItemTotal(order_item);
    var row = shared.element("div",{id: id},'',self.order_items_container);
    _set('item',order_item,row);
    var name = shared.element('div',{id: id + '_name'},order_item.name,row); 
    name.addClass('table-column table-cell pos-item-attr pos-item-name pointer no-select');
    name.unbind();
    name.mousedown(function (event) {
        self.dont_focus_sku_input = true;
        self.detailedOrderItemMenu(event);
    });
    
    var quantity = shared.element('div',{id: id + '_quantity' },order_item.quantity,row); 
    quantity.addClass('table-column table-cell pos-item-attr pos-item-price pointer no-select');
    quantity.unbind();
    
    quantity.mousedown(function () {
      self.dont_focus_sku_input = true;
      var order_item = _get('item',$(this).parent());
      //because order_item is an object it is a pointer!
      var inp = shared.element('input',{id: 'quantity_input_' + id},'',self.order_items_container);
      inp.val(order_item.quantity);
      inp.addClass('floating-input');
      inp.css({position: 'absolute'});
      inp.offset(quantity.offset());
      inp.width(quantity.outerWidth() - 10);
      inp.height(quantity.outerHeight() - 4);
      inp.on('keyup',function () {
        order_item.quantity = $(this).val(); // remember, order_item is a pointer
        quantity.html($(this).val());
        self.updateOrderItemTotal(order_item);
        if (event.which == '13' && !event.shiftKey) {
          $(this).remove();
          self.dont_focus_sku_input = false;
          _set('order_dirty',true);
        }
      });
      inp.blur(function () {
        order_item.quantity = $(this).val();
        quantity.html($(this).val());
        self.updateOrderItemTotal(order_item);
        $(this).remove();
        self.dont_focus_sku_input = false;
        _set('order_dirty',true);
      });
      setTimeout(function () {
        inp.focus();
        inp.select();
      },100);
    }); // end quantity.onmousedown
    
    var price = shared.element('div',{id: id + '_price' },toCurrency(order_item.price),row); 
    price.addClass('table-column table-cell pos-item-attr pos-item-price pointer no-select');
    price.unbind();
    price.mousedown(function () {
      self.dont_focus_sku_input = true;
      var order_item = _get('item',$(this).parent());
      //because order_item is an object it is a pointer!
      var inp = shared.element('input',{id: 'price_input_' + id},'',self.order_items_container);
      inp.val(order_item.price);
      inp.addClass('floating-input');
      inp.css({position: 'absolute'});
      inp.offset(price.offset());
      inp.width(price.outerWidth() - 10);
      inp.height(price.outerHeight() - 4);
      inp.on('keyup',function (event) {
        order_item.price = $(this).val(); // remember, order_item is a pointer
        self.updateOrderItemTotal(order_item);
        if (event.which == '13' && !event.shiftKey) {
          console.log('input enter for price');
          $(this).remove();
          self.dont_focus_sku_input = false;
        }
        price.html(toCurrency(order_item.price));
      });
      inp.blur(function () {
        console.log('price blurred');
        order_item.price = $(this).val();
        price.html(toCurrency($(this).val()))
        self.updateOrderItemTotal(order_item);
        $(this).remove();
        self.dont_focus_sku_input = false;
      });
      setTimeout(function () {
        inp.focus();
        inp.select();
      },100);
    }); // end price.onmousedown
    
    var rebate = shared.element('div',{id: id + '_rebate' },toPercent(order_item.rebate),row); 
    rebate.addClass('table-column table-cell pos-item-attr pos-item-rebate pointer no-select');
    rebate.unbind();
    rebate.mousedown(function () {
      self.dont_focus_sku_input = true;
      var order_item = _get('item',$(this).parent());
      //because order_item is an object it is a pointer!
      var inp = shared.element('input',{id: 'rebate_input_' + id},'',self.order_items_container);
      inp.val(order_item.rebate);
      inp.addClass('floating-input');
      inp.css({position: 'absolute'});
      inp.offset(rebate.offset());
      inp.width(rebate.outerWidth() - 10);
      inp.height(rebate.outerHeight() - 4);
      inp.on('keyup',function (event) {
        order_item.rebate = $(this).val(); // remember, order_item is a pointer
        self.updateOrderItemTotal(order_item);
        if (event.which == '13' && !event.shiftKey) {
          console.log('input enter for rebate');
          $(this).remove();
          self.dont_focus_sku_input = false;
        }
        rebate.html(toPercent(order_item.rebate));
      });
      inp.blur(function () {
        console.log('rebate blurred');
        order_item.rebate = $(this).val();
        rebate.html(toPercent($(this).val()))
        self.updateOrderItemTotal(order_item);
        $(this).remove();
        self.dont_focus_sku_input = false;
      });
      setTimeout(function () {
        inp.focus();
        inp.select();
      },100);
    }); // end rebate.onmousedown
    
    if ((order_item.must_change_price == true && order_item.price == 0) && !$('.floating-input').is(":visible")) {
      console.log('setting mcp timeout');
      setTimeout(function () {
        console.log('triggering price');
        price.trigger('mousedown');
      },100);
    }
    
    var total = shared.element('div',{id: id + '_total' },toCurrency(order_item.total),row); 
    total.addClass('table-column table-cell pos-item-attr pos-item-total pointer no-select');
    if (order_item.is_buyback == true) {
      total.addClass('pos-highlight');
    }
    
  } // end this.drawOrderItem
  this.updateOrderItemTotal = function (order_item) {
    var id = "#order_item_" + order_item.index  + '_total';
    if (order_item.is_buyback == true && order_item.price > 0) {
      order_item.price *= -1;
    }
    order_item.total = Round(order_item.price * order_item.quantity,2);
    $.each(order_item.actions,function (k,action){
      if (action.behavior == "discount_after_threshold") {
        var num_of_discountables = Math.floor(order_item.quantity / action.value2);
        var total_2_discount = num_of_discountables * order_item.price;
        order_item.rebate = 0;
        var percentage = total_2_discount / order_item.total;
        order_item.rebate = percentage * 100;
        console.log(num_of_discountables,total_2_discount,percentage,order_item.rebate);
      }
    });
    order_item.total = Round(order_item.total - (order_item.total * (order_item.rebate/100)),2);
    
    
    $(id).html(toCurrency(order_item.total)); 
    var ttl = 0.0;
    for (var i = 0; i < Order.order_items.length; i++) {
      var oi = Order.order_items[i];
      ttl += oi.total;
    }
    $('#order_total').html(toCurrency(ttl));
    Order.subtotal = ttl;
    Order.total = ttl;
    _set('order_dirty',true);
  } //end updateOrderItemTotal
  this.saveOrder = function (saveonly) {
    console.log("Save called with ",saveonly);
    if (saveonly) {
      console.log("saving: ", Order);
      $.post('/orders/new_pos_complete?save=true', {order: Order}, function () {
        _set('order_dirty',true);
      });
    } else {
      $.post('/orders/new_pos_complete', {order: Order}, function () {
        _set('order_dirty',true);
      });
    }
  }
  this.collectPms = function (onlyttl) {
    var pms = [];
    $.each($('.payment-method'), function (k,v) {
      var pm = _get('payment_method',$(v));
      var amnt = _get('amount',$(v));
      if (amnt && amnt > 0) {
        var npm = {name: pm.name, internal_type: pm.internal_type, amount: amnt}
        pms.push(npm)
      }
    });
    console.log("collect pms",pms);
    return pms;
  }
  this.collectPmsTotal = function () {
    var pm_ttl = 0;
    $.each($('.payment-method'), function (k,v) {
      var pm = _get('payment_method',$(v));
      var amnt = _get('amount',$(v));
      if (amnt && amnt > 0) {
        pm_ttl = pm_ttl + amnt;
      }
    });
    return pm_ttl;
  }
  this.completeOrder = function (sender) {
    var pm = _get('payment_method',sender);
    console.log("completing order",pm.internal_type,$('#pos_sku_input').val(),Order.total);
    var amount = toFloat($('#pos_sku_input').val());
    $('#pos_sku_input').val('');
    if (amount > 0) {
      sender.html(pm.name + " " + toCurrency(amount));
      _set('amount',amount,sender); // we'll need to clear these later
    }
    var pms = self.collectPms();
    var pm_ttl = self.collectPmsTotal();
    
    console.log('pms.length',pms.length);
    if (pms.length == 0) {
      var npm = {name: pm.name, internal_type: pm.internal_type, amount: Order.total}
      pms.push(npm);
      sender.html(pm.name + " " + toCurrency(Order.total));
      pm_ttl = Order.total;
    }
    Order.payment_methods = pms;
    console.log("amount",amount,"total",Order.total);
    if ((amount == 0 && pm_ttl >= Order.total) || (pm_ttl >= Order.total)) {
      self.saveOrder(false);
    } else {
      self.saveOrder(true);
    }
    self.dont_focus_sku_input = false;
    _set('order_dirty',true);
  } // end completeOrder
  this.findItem = function (sku) {
    var sku_input = $('#pos_sku_input');
    sku_input.val('');
    if (this.seen_items[sku]) {
      console.log("i've seen this before");
    } else {
      // we need to ask the server
      $.get('/items/by_sku?sku=' + sku,function (item) {
        self.createOrderItem(item);
        self.dont_focus_sku_input = false;
      });
    } 
  } // end findItem
  this.createOrderItem = function (item) {
    Order.order_items.push(item);
    self.drawOrderItems(Order.order_items);
  }
  this.detailedOrderItemMenu = function (event) {
    $('.item-menu-div').remove();
    var target = $(event.currentTarget).parent();
    item = _get('item',target);
    var offset = $(event.currentTarget).offset();
    var title = shared.element('div',{id: 'order_item_edit_name'},'',$('body'));
    title.addClass('salor-dialog');
    title.offset(offset);
    title.css({padding: '3px',width: $(event.currentTarget).outerWidth() - 8, height: $(event.currentTarget).outerHeight(), 'border-bottom': 'none'});
    config = shared.element('div',{id: 'order_item_edit_config'},'',$('body'));
    config.addClass('salor-dialog');
    config.offset({top: offset.top + $(event.currentTarget).outerHeight() + 5, left: offset.left});
    config.css({width: $('#order_item_' + item.index).width() - 20, 'border-top':'none', 'min-height': '100px'});
    
    var name = orderItemNameOption(config,target.attr('item_id'),event.currentTarget.textContent);
    name.find('input').css({width: $('#order_item_' + item.index).width() * 0.65});
    
    var dicon = $('<div id="item_menu_delete" class="oi-menu-icon"><img src="/images/icons/delete_32.png" /></div>');
    dicon.mousedown(function () {
      var nois = [];
      for (var i = 0; i < Order.order_items.length;i++) {
        var oi = Order.order_items[i];
        if (oi.index != item.index) {
          nois.push(oi);
        } else {
          oi.hidden = 1;
          nois.push(oi);
        }
      }
      Order.order_items = nois;
      title.remove();
      config.remove();
      focusInput($('#pos_sku_input'));
      self.drawOrderItems(nois);
    });
    title.append(dicon);
    
    var buyback = $('<div id="item_menu_buyback" class="oi-menu-icon"><img src="/images/icons/money_32.png" /></div>');
    buyback.addClass('pointer');
    buyback.mousedown(function () {
      var string = '/vendors/toggle?model_id=' +
      item.id +'&klass=OrderItem' +
      '&field=toggle_buyback'+
      '&value=undefined';
      $.get(string);
      focusInput($('#pos_sku_input'));
    }).mouseup(function () {
      focusInput($('#pos_sku_input'));
    });
    title.append(buyback);
    
    if (!Register.scale == '') {
      var wicon = $('<div id="item_menu_scale" class="oi-menu-icon"><img src="/images/icons/weight_32.png" /></div>');
      wicon.mousedown(function () {
        var string = '/vendors/edit_field_on_child?id=' +
        item.id +'&klass=OrderItem' +
        '&field=quantity'+
        '&value=' + Register.scale;
        $.get(string);
        focusInput($('#pos_sku_input'));
      }).mouseup(function () {
        focusInput($('#pos_sku_input'));
      });
      title.append(wicon);
    } // end  if (!Register.scale == '') {
      
      var btn = $('<div id="item_menu_done" class="oi-menu-icon"><img src="/images/icons/tick_32.png" /></div>');
      btn.mousedown(function () {
        title.remove();
        config.remove();
        focusInput($('#pos_sku_input'));
      }).mouseup(function () {
        focusInput($('#pos_sku_input'));
      });
      title.append(btn);
      
      shared.element('h3',{id: 'order_item_options_h3'},i18n.menu.edit_item,config);
      
      var config_table = shared.element('table',{id: 'order_item_edit_table'},'',config);
      var config_table_rows = [ shared.element('tr',{id: 'order_item_edit_table_row_1'},'',config_table) ];
      
      var config_table_cols_left = [ shared.element('td',{id: 'order_item_edit_table_lcol_1'},'',config_table_rows[0]) ];
      var config_table_cols_right = [ shared.element('td',{id: 'order_item_edit_table_rcol_1'},'',config_table_rows[0]) ];
    }
}