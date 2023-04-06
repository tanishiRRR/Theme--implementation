class Admin::GenresController < ApplicationController

  # 管理者のみが特定の内容を扱えるように制限
  before_action :admin_scan, only: [:index, :create, :edit, :update]

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "You have created genre successfully."
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    if genre.save
      flash[:notice] = "You have updated genre successfully."
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

# 投稿データのストロングパラメータ
private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def admin_scan
    unless current_admin
      redirect_to new_admin_session_path
    end
  end

end
