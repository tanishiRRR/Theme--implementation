class Admin::OrderDetailsController < ApplicationController
  before_action :admin_scan, only: [:update]

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order_detail.save
      flash[:notice] = "制作ステータスを更新しました。"
      redirect_to admin_order_path(order_detail.order_id)
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end

    def admin_scan
      unless current_admin
        redirect_to new_admin_session_path
      end
    end

end
