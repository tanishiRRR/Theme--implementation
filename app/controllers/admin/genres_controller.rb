class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "You have created genre successfully."
      redirect_to admin_genres_path(@genre.id)
    else
      render :index
    end
  end

  def edit
    # 他のユーザーからのアクセスを制限
    is_matching_login_user
    @genre = Genre.find(params[:id])
  end

  def update
    # 他のユーザーからのアクセスを制限
    is_matching_login_user
    # 関数の定義
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    if @genre.save
      flash[:notice] = "You have updated genre successfully."

      redirect_to admin_genres_path(@genre.id)
    else
      render :edit
    end
  end

# 投稿データのストロングパラメータ
private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def is_matching_login_user
    admin_id = genre.find(params[:id]).admin.id
    unless admin_id == current_admin.id
      redirect_to new_admin_session_path
    end
  end

end
