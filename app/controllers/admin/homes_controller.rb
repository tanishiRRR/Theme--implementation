class Admin::HomesController < ApplicationController

  before_action :admin_scan, only: [:top]

  def top
    if params[:customer_id].present?
      @customer = Customer.find(params[:customer_id])
      @orders = Order.where(customer_id: params[:customer_id]).order(created_at: :DESC).page(params[:page]).per(10)
    else
      @orders = Order.all.order(created_at: :DESC).page(params[:page]).per(10)
    end
  end

  private

  def admin_scan
    unless current_admin
      redirect_to new_admin_session_path
    end
  end

end
