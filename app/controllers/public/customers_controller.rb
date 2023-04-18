class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  before_action :customer_scan, only: [:show, :edit, :update, :unsubscribe, :withdraw]


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    if @customer.save
      flash[:notice] = "You have updated customer successfully."
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @customer=current_customer
  end

  def withdraw
     @customer=current_customer
     @customer.update(is_deleted: true) #ここでis_deletedカラムの値をtrueに更新します。
     reset_session #この記述で現在のログイン状況をリセットすることができます。
     flash[:notice] = "退会が完了しました。" #フラッシュメッセージがあると親切ですね！
     redirect_to root_path #処理完了後ルートパスへ遷移します。
  end

  private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :emai, :postal_code, :address, :telephone_number)
    end

    def customer_scan
      unless current_customer
        redirect_to customers_my_page_path
      end
    end

end
