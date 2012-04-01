$(document).ready ->
  paper = Raphael('map',1000,640)

  for state,path of mapData
    paper.path(path)

