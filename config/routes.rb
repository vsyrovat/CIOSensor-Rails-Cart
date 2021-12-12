Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  scope 'admin' do
    get '/', to: 'admin#index'

    resources :units
    resources :goods
    resources :offers
  end

  namespace :api do
    namespace :v1 do
      get 'catalog' => 'catalog#index'
      get 'cart' => 'cart#index'
      put 'cart/item' => 'cart#put_item'
      delete 'cart/items' => 'cart#delete_cart_items'
    end
  end
end
