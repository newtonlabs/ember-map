Embermap::Application.routes.draw do
  get "maps/raphael"
  get "maps/d3"
  get "maps/learn"
  get "maps/scatter"
  get "maps/scales"
  get "maps/force"
  root :to => "maps#raphael"
end
