Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #bachelorettes
  get '/bachelorettes/:id', to: 'bachelorette#show'
  get 'bachelorette/:id/contestants', to: 'contestant#index'

  #contestants
  get '/contestant/:id', to: 'contestant#show'

  #outing
  get '/outing/:id', to: 'outing#show'
end
