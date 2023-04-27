class Admin::HomesController < ApplicationController
  def top
    if params[:customer_id].present?
      @customer = Customer.find(params[:customer_id])
      @orders = Order.where(customer_id: params[:customer_id]).order(created_at: :DESC).page(params[:page]).per(10)
    else
      @orders = Order.all.order(created_at: :DESC).page(params[:page]).per(10)
    end
  end
end
