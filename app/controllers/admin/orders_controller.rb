class Admin::OrdersController < ApplicationController
  before_action :admin_scan, only: [:index, :show, :edit, :update]

  def show
    @order = Order.find(params[:id])
  end

  def update
  end

  private
    def order_params
      params.require(:order).permit(:status)
    end

    def order_detail_params
      params.require(:orderdetail).permit(:making_status)
    end

    def admin_scan
      unless current_admin
        redirect_to new_admin_session_path
      end
    end

end
