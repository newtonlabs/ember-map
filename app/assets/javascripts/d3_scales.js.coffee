w = 500
h = 300
padding = 20
dataset = [ [ 5, 20 ], [ 480, 90 ], [ 250, 50 ], [ 100, 33 ], [ 330, 95 ], [ 410, 12 ], [ 475, 44 ], [ 25, 67 ], [ 85, 21 ], [ 220, 88 ], [ 600, 150 ] ]

xScale = d3.scale.linear()
  .domain([ 0, d3.max(dataset, (d) -> d[0] ) ])
  .range([ padding, w - padding * 2 ])

yScale = d3.scale.linear().
  domain([ 0, d3.max(dataset, (d) -> d[1] ) ])
  .range([ h - padding, padding ])

rScale = d3.scale.linear()
  .domain([ 0, d3.max(dataset, (d) -> d[1] ) ])
  .range([ 1, 20 ])

svg = d3.select("#scales #graph").append("svg")
  .attr("width",  w)
  .attr("height", h)

svg.selectAll("circle").data(dataset).enter().append("circle")
  .attr("cx", (d) -> xScale d[0] )
  .attr("cy", (d) -> yScale d[1] )
  .attr("r",  (d) -> rScale d[1] )

svg.selectAll("text").data(dataset).enter().append("text")
  .text((d) -> d[0] + "," + d[1] )
  .attr("x", (d) -> xScale d[0] )
  .attr("y", (d) -> yScale d[1] )
  .attr("font-family", "sans-serif")
  .attr("font-size", "11px").attr "fill", "blue"

d3.select("#scale button.default").on "click", ->
  svg.selectAll("circle").transition().duration("1500").attr("r", (d) -> rScale d[1])

d3.select("#scale button.large").on "click", ->
  svg.selectAll("circle").transition().duration("1500").attr("r", (d) -> rScale d[1] * 3.00)
