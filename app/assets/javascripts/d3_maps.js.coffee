$(document).ready ->
  w = 1000
  h = 640

  clickedColor = (clicked, name) ->
    if (clicked == name) then 'steelblue' else '#ccc'

  svg     = d3.select("#draw").append("svg").attr("width", w).attr("height", h)
  country = svg.append("g").attr("class","country")
  states  = country.selectAll('path').data(mapData).enter().append('path')
    .attr('d', (d) -> d.path)
    .attr('fill',"rgb(220,220,220)")
    .attr('stroke', 'white')
    .attr('state', (d) -> d.name)
    .attr('clicks', 0)

  d3.select("#draw button.remove").on "click", ->
    svg.selectAll("path").transition().duration(1000).attr('stroke','#ccc')

  d3.select("#draw button.add").on "click", ->
    svg.selectAll("path").transition().duration(1000).attr('stroke','white')

  d3.selectAll("#draw path").on "click", ->
    d3.select(@).transition().duration("300").attr('fill', (d) ->
      d.clicks += 1
      "rgb(220, #{220-d.clicks*25}, #{220-d.clicks*25})")

  # d3.select('state="GA"').attr('fill','yellow')

  # d3.selectAll("#draw path").on "mouseover", ->
  #   clicked = $(@).attr('state')
  #   d3.select(@).transition().duration('100').attr('fill', 'steelblue')

  # d3.selectAll("#draw path").on "mouseout", ->
  #   clicked = $(@).attr('state')
  #   d3.select(@).transition().duration('100').attr('fill', '#ccc')
