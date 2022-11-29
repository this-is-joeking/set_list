Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/songs', to: 'songs#index'
  # can receive request for /songs and route to controller songs index
  # name of controller and action of controller
end
