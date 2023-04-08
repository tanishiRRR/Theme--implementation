class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

end
