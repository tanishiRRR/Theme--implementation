class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "You have created item successfully."
      redirect_to admin/items_path(@item.id)
    else
      @items = Item.all
      render :index
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
end
