$(document).ready ->

  if ($('#map').length > 0)
    paper = Raphael('map',1000,640)

    for state in mapData
      poly = paper.path(state.path)
      poly.attr("fill", "#ccc").attr('stroke','white').data('state',state.name)
      poly.click ->
        alert("id: #{@id} ==> #{@data("state")}")
      poly.mouseover ->
        @toFront()
        @attr('fill',"#ddd")
        @gloweffect = @glow({width: 20})
      poly.mouseout ->
        @attr('fill','#ccc')
        @gloweffect.remove()
