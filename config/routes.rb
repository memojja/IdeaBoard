Rails.application.routes.draw do
  root "ideas#index"

  resources :ideas
  #
  #get 'ideas/new', to: 'ideas#new', as: "idea_new"
  #get 'ideas', to: 'ideas#index'
  #get 'ideas/:id', to: 'ideas#show', as: "idea"
  #post 'ideas', to: 'ideas#create'
  #get 'ideas/:id/edit', to: 'ideas#edit', as: "edit_idea"
  #put 'ideas/:id', to: 'ideas#update'
  #delete 'ideas/:id', to: 'ideas#destroy' , as: "delete_idea"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
