Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'authenticates#index'
  post '/login', to: 'authenticates#login'
  get '/books', to: 'books#index'
end
