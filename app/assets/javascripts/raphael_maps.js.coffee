$(document).ready ->

  if ($('#map').length > 0)
    paper = Raphael('map',1000,640)

    for state in mapData

      # Setup the polygons with data values and such
      poly = paper.path(state.path)
      poly.attr("fill", "#ccc").attr('stroke','white').data('state',state.name)

      # Sample Click Binding.  Raphael maintains an internal object store with an id
      # Data is bound to these objects and can be fetched with the id
      # TODO: How do marry this with ember?
      poly.click ->
        alert("id: #{@id} ==> #{@data("state")}")

      # Some sample effects of hover overs
      poly.mouseover ->
        @toFront()
        @attr('fill',"#ddd")
        @gloweffect = @glow({width: 20})
      poly.mouseout ->
        @attr('fill','#ccc')
        @gloweffect.remove()
