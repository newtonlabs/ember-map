$(document).ready ->
  w = 1000
  h = 640

  (->
    svg = d3.select("#draw").append("svg").attr("width", w).attr("height", h)
    for state,path of mapData
      svg.append("svg:path").attr("d", path).attr("state", state).attr("fill","#ccc").attr("stroke", "white").attr("class","state")

    d3.select("#draw button").on "click", ->
      svg.selectAll(".state").style("stroke-width", 1).transition().duration(750).attr('stroke','#ccc')
  )()