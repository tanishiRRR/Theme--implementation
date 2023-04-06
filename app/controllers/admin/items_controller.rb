class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(10)
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
    # 他のユーザーからのアクセスを制限
    # is_matching_login_user
    # # 関数の定義
    # @book = Book.find(params[:id])
  end

  def update
    # 他のユーザーからのアクセスを制限
    # is_matching_login_user
    # # 関数の定義
    # @book = Book.find(params[:id])
    # @book.update(book_params)
    # if @book.save
    #   flash[:notice] = "You have updated book successfully."
    #   redirect_to book_path(@book.id)
    # else
    #   render :edit
    # end
  end

# 投稿データのストロングパラメータ
private
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end

  # def is_matching_login_user
  #   user_id = Book.find(params[:id]).user.id
  #   unless user_id == current_user.id
  #     redirect_to books_path
  #   end
  # end

end