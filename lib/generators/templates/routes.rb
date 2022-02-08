Rails.application.routes.draw do
  root to: 'home#index'
  
  get 'home/index'
  devise_for :users
  devise_scope :users do
    get 'sign_in', to: 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
