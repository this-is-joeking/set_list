Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/songs', to: 'songs#index'
  # can receive request for /songs and route to controller songs index
  # name of controller and action of controller

  # routes is a pattern matcher
  # like a restaurant reservation
  # go into restaurant and they have a list of reservations
  # this is the list of reservations, if it is not here then there is no 
  # reservation and you can't go into the restaraunt

  get '/songs/:id', to: 'songs#show'
  # the colon means that section is dynamic, it could be anything
  # :id behaves similarly to a variable here, not really a symbol, it is part of DSL
  # alternativiley /songs/ is static so it has to be /songs/

  get '/artists/:id', to: 'artists#show'
  get '/artists/:artist_id/songs', to: 'artist_songs#index'
end
