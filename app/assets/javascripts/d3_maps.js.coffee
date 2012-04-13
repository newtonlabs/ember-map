$(document).ready ->
  w = 1000
  h = 640

  (->
    svg = d3.select("#draw").append("svg").attr("width", w).attr("height", h)
    for state,path of mapData
      svg.append("svg:path").attr("d", path).attr("state", state).attr("fill","#ccc").attr("stroke", "white").attr("class","state")
    # circle = svg.selectAll(".little").data(data).enter().append("circle").attr("class", "little").attr("cx", x).attr("cy", y).attr("r", 12)
    # d3.select("#draw button").on "click", ->
    #   circle.style("fill", "#aaa").attr("r", 12).attr "cy", y
    #   circle.transition().duration(500).delay(0).style "fill", "steelblue"
    #   circle.transition().duration(500).delay(500).attr "cy", 90
    #   circle.transition().duration(500).delay(1000).attr "r", 30
    d3.select("#draw button").on "click", ->
      svg.selectAll(".state").style("stroke-width", 1).transition().duration(750).attr('stroke','#ccc')
      # svg.selectAll(".select").data(data).enter().append("circle").attr("class", "select").attr("cx", x).attr("cy", y).attr("r", 60).style("fill", "none").style("stroke", "red").style("stroke-opacity", 1e-6).style("stroke-width", 3).transition().duration(750).attr("r", 12).style "stroke-opacity", 1
  )()