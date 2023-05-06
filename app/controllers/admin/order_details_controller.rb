class Admin::OrderDetailsController < ApplicationController
  before_action :admin_scan, only: [:update]

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(@order_detail.order_id)
    @order_details = @order.order_details.all

    is_update = true
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.making_status == "in_production"
      # ②製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
      # ここから下の内容は③の内容になります。
      # 紐付いている注文商品の製作ステータスが "すべて" [製作完了]になった際に注文ステータスを「発送準備中」に更新させたいので、
      @order_details.each do |order_detail|  #　紐付いている注文商品の製作ステータスを一つ一つeach文で確認していきます。
        if order_detail.making_status != "completion_of_production" # 製作ステータスが「製作完了」ではない場合
          is_update = false
        end
      end
      @order.update(status: 3) if is_update == true
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。
      # 上記のif文でis_updatedがfalseになっている場合、更新されません。
    end
      flash[:notice] = "制作ステータスを更新しました。"
      redirect_to admin_order_path(@order_detail.order_id)
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
