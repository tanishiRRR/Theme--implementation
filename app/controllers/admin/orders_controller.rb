class Admin::OrdersController < ApplicationController
  before_action :admin_scan, only: [:index, :show, :edit, :update]

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order_details = OrderDetail.where(order_id: params[:id])
    if order.update(order_params)
      order_details.update_all(making_status: 1) if order.status == "payment_confirmation"
    end
      flash[:notice] = "注文ステータスを更新しました。"
      redirect_to admin_order_path(order.id)
  end

  private
    def order_params
      params.require(:order).permit(:status)
    end

    def admin_scan
      unless current_admin
        redirect_to new_admin_session_path
      end
    end

end
