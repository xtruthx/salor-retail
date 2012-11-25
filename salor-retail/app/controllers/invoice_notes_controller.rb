class InvoiceNotesController < ApplicationController
  
  def index
    @invoice_notes = InvoiceNote.scopied(@current_employee)
  end
  
  def new
    @sale_types = SaleType.scopied(@current_employee)
    @countries = Country.scopied(@current_employee)
    @invoice_note = InvoiceNote.new
  end
  
  def create
    #debugger
    @invoice_note = InvoiceNote.new(params[:invoice_note])
    @invoice_note.set_model_owner
    @sale_types = SaleType.scopied(@current_employee)
    @countries = Country.scopied(@current_employee)
    if @invoice_note.save
      redirect_to invoice_notes_path
    else
      render :new
    end
  end
  
  def update
    @invoice_note = InvoiceNote.find_by_id(params[:id])
    if @invoice_note.update_attributes(params[:invoice_note])
      redirect_to invoice_notes_path
    else
      render :new
    end
  end
  
  def edit
    @sale_types = SaleType.scopied(@current_employee)
    @countries = Country.scopied(@current_employee)
    @invoice_note = InvoiceNote.find_by_id(params[:id])
    redirect_to invoice_notes_path and return unless @invoice_note
    render :new
  end
  
  def destroy
    @invoice_note = InvoiceNote.find_by_id(params[:id])
    redirect_to invoice_notes_path and return unless @invoice_note
    @invoice_note.update_attribute :hidden, true
    redirect_to invoice_notes_path
  end
  before_filter :initialize_instance_variables,:authify,:crumble
  private
  def crumble
    @vendor = @current_employee.get_vendor(@current_employee.meta.vendor_id)
    add_breadcrumb @vendor.name,'vendor_path(@vendor)'
    add_breadcrumb I18n.t("activerecord.models.invoice_note.other"),'invoice_notes_path(:vendor_id => params[:vendor_id])'
  end
end
