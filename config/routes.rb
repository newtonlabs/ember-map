Embermap::Application.routes.draw do
  get "map/index"

  get "maps/index"

  root :to => "home#index"
end
