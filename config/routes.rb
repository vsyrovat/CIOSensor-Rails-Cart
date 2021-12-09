Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  scope 'admin' do
    get '/', to: 'admin#index'

    resources :units
    resources :goods
    resources :offers
  end
end
