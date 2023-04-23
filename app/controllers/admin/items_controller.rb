class Admin::ItemsController < ApplicationController

  # 管理者のみが特定の内容を扱えるように制限
  before_action :admin_scan, only: [:index, :new, :create, :show, :edit, :update]

  def index
    @items = Item.all.page(params[:page]).per(10)
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "You have created item successfully."
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:notice] = "You have updated item successfully."
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

# 投稿データのストロングパラメータ
private
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end

  def admin_scan
    unless current_admin
      redirect_to new_admin_session_path
    end
  end

end