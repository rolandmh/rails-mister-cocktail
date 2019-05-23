Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # # see list of cocktails
  # get '/cocktails', to: 'cocktails#index'
  # # show cocktail, with the dose needed for each ingredient
  # get '/cocktails/:id', to: 'cocktails#show'
  # # new cocktail
  # get '/cocktails/new', to: 'cocktails#new'
  # # create cocktail
  # post '/cocktails/', to: 'cocktails#create'
  resources :cocktails, only: [ :index, :show, :new, :create ] do
    resources :doses, only: [ :new, :create ]
  end

  resources :doses, only: [ :destroy ]
  # add new dose to cocktail (ingredient/description pair)
  # dropdown list for ingredients list
  # delete dose -> delete link
end
