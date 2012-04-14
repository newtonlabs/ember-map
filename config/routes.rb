Embermap::Application.routes.draw do
  get "maps/raphael"
  get "maps/d3"
  get "maps/learn"
  root :to => "maps#raphael"
end
