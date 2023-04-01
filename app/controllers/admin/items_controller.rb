class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "You have created item successfully."
      redirect_to admin_path(@item.id)
    else
      render :new
    end
  end

  def show
  end

  def index
  end


  def edit
  end

  def update
  end

# 投稿データのストロングパラメータ
private
  def item_params
    params.require(:item).premit(:name, :introduction, :price, :is_active)
  end

end