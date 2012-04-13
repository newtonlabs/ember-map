$(document).ready ->
  data = [ 32, 57, 112 ]
  dataEnter = data.concat(293)
  dataExit = data.slice(0, 2)
  w = 360
  h = 180
  x = d3.scale.ordinal().domain([ 57, 32, 112 ]).rangePoints([ 0, w ], 1)
  y = d3.scale.ordinal().domain(data).rangePoints([ 0, h ], 2)

  (->
    svg = d3.select("#draw").append("svg").attr("width", w).attr("height", h)
    circle = svg.selectAll(".little").data(data).enter().append("circle").attr("class", "little").attr("cx", x).attr("cy", y).attr("r", 12)
    d3.select("#draw button").on "click", ->
      circle.style("fill", "#aaa").attr("r", 12).attr "cy", y
      circle.transition().duration(500).delay(0).style "fill", "steelblue"
      circle.transition().duration(500).delay(500).attr "cy", 90
      circle.transition().duration(500).delay(1000).attr "r", 30
  )()