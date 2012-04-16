$(document).ready ->
  w = 1000
  h = 640

  clickedColor = (clicked, name) ->
    if (clicked == name) then 'steelblue' else '#ccc'

  svg     = d3.select("#draw").append("svg").attr("width", w).attr("height", h)
  country = svg.append("g").attr("class","country")
  states  = country.selectAll('path').data(mapData).enter().append('path')
    .attr('d', (d) -> d.path)
    .attr('fill','#ccc')
    .attr('stroke', 'white')
    .attr('state', (d) -> d.name)

  d3.select("#draw button.remove").on "click", ->
    svg.selectAll("path").transition().duration(1000).attr('stroke','#ccc')

  d3.select("#draw button.add").on "click", ->
    svg.selectAll("path").transition().duration(1000).attr('stroke','white')

  d3.selectAll("#draw path").on "click", ->
    clicked = $(@).attr('state')
    d3.selectAll('path').transition().duration('350').attr('fill', (d) -> clickedColor(clicked, d.name))
