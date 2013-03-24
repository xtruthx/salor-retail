function updateDrawer(obj) {
  $('.pos-cash-register-amount').html(toCurrency(obj.amount));
  $('.eod-drawer-total').html(toCurrency(obj.amount));
  $('#header_drawer_amount').html(toCurrency(obj.amount));
}

function ajax_log(data) {
  console.log(data);
  $.ajax({
    url:'/orders/log',
    type:'post',
    data:data
  });
}