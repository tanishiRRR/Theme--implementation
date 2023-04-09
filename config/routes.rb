Rails.application.routes.draw do

# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}

  scope module: :public do

    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'

    resources :items, only: [:index, :show]
    # get 'items' => 'items#index'
    # get 'items/:id' => 'items#show', as: 'item'

    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' =>'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :cart_items, only: [:index, :update, :destroy, :create]
    # get 'cart_items' => 'cart_items#index'
    # patch 'cart_items/:id' => 'cart_items#update'
    # delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy_item'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    # post 'cart_items' => 'cart_items#create', as: 'create_item'

    resources :order, only: [:new, :create, :index , :show]
    # get 'orders/new' => 'orders#new'
    post 'orders/confirm' => 'orders#comfirm'
    get 'orders/complete' => 'orders#complete'
    # post 'orders' => 'orders#create'
    # get 'orders' => 'orders#index'
    # get 'orders/:id' => 'orders#show', as: 'order'

    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    # get 'addresses' => 'addresses#index'
    # post 'addresses' => 'addresses#create'
    # get 'addresses/:id/edit' => 'addresses#edit', as: 'edit_address'
    # patch 'addresses/:id' => 'addresses#update'
    # delete 'addresses/:id' => 'addresses#destroy', as: 'destroy_address'
  end

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do

    root to: 'homes#top'

    resources :items, only: [:index, :new,:create, :show, :edit, :update]
    # get 'items' => 'items#index'
    # get 'items/new' => 'items#new'
    # post 'items' => 'items#create', as: 'create_item'
    # get 'items/:id' => 'items#show', as: 'item'
    # get 'items/:id/edit' => 'items#edit', as: 'edit_item'
    # patch 'items/:id' => 'items#update', as: 'update_item'

    resources :genres, only: [:index, :create, :edit, :update]
    # get 'genres' => 'genres#index'
    # post 'genres' => 'genres#create'
    # get 'genres/:id/edit' => 'genres#edit', as: 'edit_genre'
    # patch 'genres/:id' => 'genres#update', as: 'update_genre'

    resources :customers, only: [:index, :show, :edit, :update]
    # get 'customers' => 'customers#index'
    # get 'customers/:id' => 'customers#show', as: 'customer'
    # get 'customers/:id/edit' => 'customers#edit', as: 'edit_customer'
    # patch 'customers/:id' => 'customers#update'

    resources :orders, only: [:show, :update]
    # get 'orders/:id' => 'orders#show', as: 'order'
    # patch 'orders/:id' => 'orders#update'

    patch 'orders/:order_id/order_details/:id' => 'order_details#update', as: 'order_detail'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
