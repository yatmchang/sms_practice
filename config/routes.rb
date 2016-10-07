Rails.application.routes.draw do

  root "contacts#index"
  resources :contacts, only: [:index, :new, :create] do
    resources :charges, only: [:new, :create]
  end 
end
