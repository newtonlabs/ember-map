$(document).ready ->
  paper = Raphael('map',1000,640)

  for state,path of mapData
    state = paper.path(path)
    state.attr("fill", "#ccc")
    state.attr('stroke','white')
    state.attr('data-name', state)

