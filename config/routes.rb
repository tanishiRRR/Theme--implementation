Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: 'homes#top'
  get 'homes/about' => 'homes#about',as: 'about'
  get 'items' => 'public/items#index'
  get 'items/:id' => 'public/items#show'
  
  
  get 'addresses/index'
  get 'addresses/edit'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/destroy'
  get 'orders/new'
  get 'orders/comfirm'
  get 'orders/complete'
  get 'orders/create'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/index'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'cart_items/create'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/unsubscribe'
  get 'customers/withdraw'

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'homes/top'
    get 'order_details/update'
    get 'orders/show'
    get 'orders/update'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
