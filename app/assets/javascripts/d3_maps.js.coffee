$(document).ready ->
  w = 1000
  h = 640


  # Totally doing this wrong now that I understand it.. Bad for loop Bad!! Use date/enter!!

  (->
    svg = d3.select("#draw").append("svg").attr("width", w).attr("height", h)
    country = svg.append("g").attr("class","country")
    for state,path of mapData
      country.append("svg:path").attr("d", path).attr("state", state).attr("fill","#ccc").attr("stroke", "white").attr("class","state")

    d3.select("#draw button.remove").on "click", ->
      svg.selectAll(".state").style("stroke-width", 1).transition().duration(1000).attr('stroke','#ccc')

    d3.select("#draw button.add").on "click", ->
      svg.selectAll(".state").style("stroke-width", 1).transition().duration(1000).attr('stroke','white')

    d3.selectAll("#draw path").on "click", ->
      d3.selectAll(".state").attr("fill","#ccc")
      d3.select(@).style("stroke-width", 1).transition().duration(500).attr('fill','steelblue')
  )()