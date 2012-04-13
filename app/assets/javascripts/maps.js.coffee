$(document).ready ->
  paper = Raphael('map',1000,640)

  for state,path of mapData
    poly = paper.path(path)
    poly.attr("fill", "#ccc")
    poly.attr('stroke','white')
    poly.mouseover ->
      @toFront()
      @attr('fill',"#ddd")
      @gloweffect = @glow({width: 20})
    poly.mouseout ->
      @attr('fill','#ccc')
      @gloweffect.remove()
