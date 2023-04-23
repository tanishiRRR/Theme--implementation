class Public::ItemsController < ApplicationController

  def index
    # byebug
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id]).order(created_at: :desc).page(params[:page]).per(10)
    else
      @items = Item.all.order(created_at: :desc).page(params[:page]).per(10)
    end
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
