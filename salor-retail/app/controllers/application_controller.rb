# coding: UTF-8

# Salor -- The innovative Point Of Sales Software for your Retail Store
# Copyright (C) 2012-2013  Red (E) Tools LTD
# 
# See license.txt for the license applying to all files within this software.
require "net/http"
require "uri"
class ApplicationController < ActionController::Base
  # {START}
  include SalorBase
  helper :all
  helper_method :workstation?, :mobile?
  protect_from_forgery
  before_filter :loadup, :except => [:load_clock, :add_item_ajax, :login, :render_error]
  before_filter :pre_load, :except => [:render_error]
  before_filter :setup_global_data, :except => [:login, :render_error]
  layout :layout_by_response
  helper_method [:user_cache_name]

  unless SalorRetail::Application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
  end 
  def get_url(url)
    uri = URI.parse(url)
    
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    
    response = http.request(request)
    return response
  end
  def is_mac?
     RUBY_PLATFORM.downcase.include?("darwin")
  end

  def is_windows?
     RUBY_PLATFORM.downcase.include?("mswin")
  end

  def is_linux?
     RUBY_PLATFORM.downcase.include?("linux")
  end   
  def pre_load
  end
  def render_csv(filename = nil,text = nil)
    filename ||= params[:action]
    filename += '.csv'
  
    if request.env['HTTP_USER_AGENT'] =~ /msie/i
      headers['Pragma'] = 'public'
      headers["Content-type"] = "text/plain" 
      headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
      headers['Content-Disposition'] = "attachment; filename=\"#{filename}\"" 
      headers['Expires'] = "0" 
    else
      headers["Content-Type"] ||= 'text/csv'
      headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" 
    end  
    if text then
      render :text => text
    else
      render :layout => false
    end
  end

  def workstation?
    request.user_agent.nil? or request.user_agent.include?('Firefox') or request.user_agent.include?('MSIE') or request.user_agent.include?('Macintosh') or request.user_agent.include?('Chrom') or request.user_agent.include?('iPad') or request.user_agent.include?('Qt/4')
  end

  def mobile?
    not workstation?
  end

  def salor_signed_in?
    if session[:user_id] and session[:user_type] and (Employee.exists? session[:user_id] or User.exists? session[:user_id]) then
      return true
    else
      return false
    end
  end

  def admin_signed_in?
    if session[:user_id] and session[:user_type] == "User" then
      return true
    else
      return false
    end
  end

  def current_user
    return User.find session[:user_id] if session[:user_type] == "User"
  end

  def salor_user
    if session[:user_id] then
      if session[:user_type] == "User" then
        user= User.find_by_id(session[:user_id].to_i)
      else
        user= Employee.find_by_id(session[:user_id])
      end
      return user
    end
    return nil
  end

  def user_cache_name
    return salor_user.username if salor_signed_in?
    return 'loggedout'
  end

  def load_clock
    render :layout => false
  end

  private
  def allowed_klasses
    ['LoyaltyCard','Item','ShipmentItem','Vendor','Category','Location','Shipment','Order','OrderItem','CashRegisterDaily']
  end
  def initialize_instance_variables
    @current_employee = salor_user
    $User = @current_employee
    @current_vendor = @current_employee.vendor
    if params[:vendor_id] and not params[:vendor_id].blank? then
      @current_employee.meta.update_attribute(:vendor_id,params[:vendor_id])
      @current_vendor = Vendor.find_by_id(params[:vendor_id])
    end
    if @current_employee and @current_employee .meta.vendor_id.nil? then
      @current_employee.meta.update_attribute(:vendor_id,@current_employee.get_default_vendor.id)
    end
    if params[:cash_register_id] then
      @current_employee.meta.update_attribute(:cash_register_id,params[:cash_register_id])
    end
    if @current_employee then
	    @tax_profiles = TaxProfile.scopied(@current_employee)
      if @current_employee.meta.cash_register_id then
        @current_register = CashRegister.find_by_id(@current_employee.meta.cash_register_id)
	    end
      if Vendor.exists?(@current_employee.meta.vendor_id) then
        @current_vendor = Vendor.find(@current_employee.meta.vendor_id)
	    else 
	      raise "NoVendorExists"
	    end
    end
    @current_configuration = @current_vendor.salor_configuration if @current_vendor
  end

  def layout_by_response
    if params[:ajax] then
       return false
    end
    return "application"
  end
  
  def loadup
    $Notice = ""
    SalorBase.log_action("ApplicationController.loadup","--- New Request -- \n" + params.inspect)
    I18n.locale = AppConfig.locale
    
    if params[:license_accepted].to_s == "true" then
      Vendor.first.salor_configuration.update_attribute :license_accepted, true
    end
	  if salor_signed_in? and salor_user then
      I18n.locale = salor_user.language
		  @owner = salor_user.get_owner
		  if salor_user.meta.nil? then
        salor_user.meta = Meta.new
        salor_user.meta.save
      end
    end
    I18n.locale = params[:locale] if params[:locale]
    add_breadcrumb I18n.t("menu.home"),'home_user_employee_index_path'
    @page_title = "Salor"
    @page_title_options = {}
  end

  protected

  def render_error(exception)
    #log_error(exception)
    @exception = exception
    if notifier = Rails.application.config.middleware.detect { |x| x.klass == ExceptionNotifier }
      env['exception_notifier.options'] = notifier.args.first || {}                   
      ExceptionNotifier::Notifier.exception_notification(env, exception).deliver
      env['exception_notifier.delivered'] = true
    end
    render :template => '/errors/error', :layout => 'customer_display'
  end

  def authify
    if not salor_signed_in? then
      # puts  "Not Signed in..";
      redirect_to '/home/index' and return
    end
    return true
  end
  def add_breadcrumb(name, url = '')
    begin
    @breadcrumbs ||= []
      url = eval(url) if url =~ /_path|_url|@/
      @breadcrumbs << [name, url]
    rescue

    end
  end
 
  def self.add_breadcrumb(name, url, options = {})
    before_filter options do |controller|
      controller.send(:add_breadcrumb, name, url)
    end
  end
  def initialize_order
    if params[:order_id] then
      o = Order.scopied(@current_employee).where("id = #{params[:order_id]} and (paid IS NULL or paid = 0)").first
      # puts  "!!!!!!!! Found order from params!"
      @current_employee.get_meta.update_attribute :order_id, o.id
      o.update_attribute :employee_id, @current_employee.id
      return o if o
    end
    if not @current_employee.meta.order_id or not Order.exists? @current_employee.meta.order_id then
      order = @current_employee.get_new_order
      @current_employee.meta.update_attribute(:order_id,order.id)
      order.update_attribute :employee_id, @current_employee.id
    else
      order = @current_employee.get_order(@current_employee.meta.order_id)
      order.update_attribute :employee_id, @current_employee.id
    end
    return order
  end
  #
  def setup_global_data
    $Request = request
    $Params = params
  end
  def check_role
    if not role_check(params) then 
      redirect_to(role_check_failed) and return
    end  
  end
  def role_check_failed
    return salor_user.get_root.merge({:notice => I18n.t("system.errors.no_role")})
  end
  
  def role_check(p)
    return true if AppConfig.roleless == true
    return salor_user.can(p[:action] + '_' + p[:controller])
  end
  
  # TODO: Remove method check_license since no longer used
  def check_license()
    return true
  end
  
  def assign_from_to(p)
    begin
      f = Date.civil( p[:from][:year ].to_i,
                      p[:from][:month].to_i,
                      p[:from][:day  ].to_i) if p[:from]
      t = Date.civil( p[:to  ][:year ].to_i,
                      p[:to  ][:month].to_i,
                      p[:to  ][:day  ].to_i) if p[:to]
    rescue
#       f = t = nil
      
    end
    f ||= DateTime.now.beginning_of_day
    t ||= DateTime.now.end_of_day
    return f, t
  end
  def time_from_to(p)
    begin
      f = DateTime.civil( p[:from][:year ].to_i,
                      p[:from][:month].to_i,
                      p[:from][:day  ].to_i,
                      p[:from][:hour  ].to_i,
                      p[:from][:minute  ].to_i,0) if p[:from]
      t = DateTime.civil( p[:to  ][:year ].to_i,
                      p[:to  ][:month].to_i,
                      p[:to  ][:day  ].to_i,
                      p[:to][:hour  ].to_i,
                      p[:to][:minute  ].to_i,0) if p[:to]
    rescue
      f = t = nil
    end

    f ||= 0.day.ago
    t ||= 0.day.ago
    return f, t
  end
  # {END}
end
