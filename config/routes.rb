Rails.application.routes.draw do

# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: 'public/homes#top'
  get 'homes/about' => 'public/homes#about', as: 'about'

  get 'items' => 'public/items#index'
  get 'items/:id' => 'public/items#show'

  # get 'customers/sign_up' => 'public/registrations#new'
  # post 'customers' => 'public/registrations#create'

  # get 'customers/sign_in' => 'public/sessions#new'
  # post 'customers/sign_in' => 'public/sessions#create'
  # delete 'customers/sign_out' => 'public/sessions#destroy'

  get 'customers/my_page' => 'public/customers#show'
  get 'customers/information/edit' =>'public/customers#edit'
  patch 'customers/information' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'

  get 'cart_items' => 'public/cart_items#index'
  patch 'cart_items/:id' => 'public/cart_items#update'
  delete 'cart_items/:id' => 'public/cart_items#destroy'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post 'cart_items' => 'public/cart_items#create'

  get 'orders/new' => 'public/orders#new'
  post 'orders/confirm' => 'public/orders#comfirm'
  get 'orders/complete' => 'public/orders#complete'
  post 'orders' => 'public/orders#create'
  get 'orders' => 'public/orders#index'
  get 'orders/:id' => 'public/orders#show'

  get 'addresses' => 'public/addresses#index'
  get 'addresses/:id/edit' => 'public/addresses#edit'
  post 'addresses' => 'public/addresses#create'
  patch 'addresses/:id' => 'public/addresses#update'
  delete 'addresses/:id' => 'public/addresses#destroy'

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    # get 'sign_in' => 'sessions#new'
    # post 'sign_in' => 'sessions#create'
    # delete 'sign_out' => 'sessions#destroy'

    root to: 'homes#top'

    get 'items' => 'items#index'
    get 'items/new' => 'items#new'
    post 'items' => 'items#create'
    get 'items/:id' => 'items#show'
    get 'items/:id/edit' => 'items#edit'
    patch 'items/:id' => 'items#update'

    get 'genres' => 'genres#index'
    post 'genres' => 'genres#create'
    get 'genres/:id/edit' => 'genres#edit'
    patch 'genres/:id' => 'genres#update'

    get 'customers' => 'customers#index'
    get 'customers/:id' => 'customers#show'
    get 'customers/:id/edit' => 'customers#edit'
    patch 'customers/:id' => 'customers#update'

    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'

    patch 'orders/:order_id/order_details/:id' => 'order_details#update'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
