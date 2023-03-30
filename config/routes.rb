Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: 'public/homes#top'
  get 'homes/about' => 'public/homes#about', as: 'about'

  get 'items' => 'public/items#index'
  get 'items/:id' => 'public/items#show'

  get 'customers/sign_up' => 'public/registrations#new'
  post 'customers' => 'public/registrations#create'

  get 'customers/sign_in' => 'public/sessions#new'
  post 'customers/sign_in' => 'public/sessions#create'
  delete 'customers/sign_out' => 'public/sessions#destroy'

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
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'admin/sign_in' => 'sessions#new'
    post 'admin/sign_in' => 'sessions#create'
    delete 'admin/sign_out' => 'sessions#destroy'

    get 'admin' => 'admin/homes#top'

    get 'admin/items' => 'admin/items#index'
    get 'admin/items/new' => 'admin/items#new'
    post 'admin/items' => 'admin/items#create'
    get 'admin/items/:id' => 'admin/items#show'
    get 'admin/items/:id/edit' => 'admin/items#edit'
    patch 'admin/items/:id' => 'admin/items#update'

    get 'admin/genres' => 'admin/genres#index'
    post 'admin/genres' => 'admin/genres#create'
    get 'admin/genres/:id/edit' => 'admin/genres#edit'
    patch 'admin/genres/:id' => 'admin/genres#update'

    get 'admin/customers' => 'admin/customers#index'
    get 'admin/customers/:id' => 'admin/customers#show'
    get 'admin/customers/:id/edit' => 'admin/customers#edit'
    patch 'admin/customers/:id' => 'admin/customers#update'

    get 'admin/orders/:id' => 'admin/orders#show'
    patch 'admin/orders/:id' => 'admin/orders#update'

    patch 'admin/orders/:order_id/order_details/:id' => 'admin/order_details#update'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
