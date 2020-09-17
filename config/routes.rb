Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #bachelorettes
  get '/bachelorettes/:id', to: 'bachelorette#show'
  get 'bachelorette/:id/contestants', to: 'contestants#index'
end
