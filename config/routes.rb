Embermap::Application.routes.draw do
  get "maps/raphael"
  get "maps/d3"
  root :to => "maps#raphael"
end
