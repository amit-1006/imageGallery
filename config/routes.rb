Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'root#home'
  get '/home', to:'root#home'
  get '/new', to:'root#create'
  post '/new', to:'root#add'
  get '/show/:id', to:'root#show'
  get 'edit/:id', to:'root#editForm'
  post '/update',to:'root#updateForm'
  delete '/delete/:id',to:'root#delete'
  get '/search', to:'root#search'
end
