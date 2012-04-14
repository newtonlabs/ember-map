dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13, 11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]

w = 1000
h = 100
barPadding = 1

svg = d3.select("#circles")
  .append("svg")
  .attr("width", w)
  .attr("height", h);

circles = svg.selectAll("circle")
  .data(dataset)
  .enter()
  .append("circle")

circles
  .attr("cx",(d,i) ->
    return (i * 50) + 25 )
  .attr("cy", h/2)
  .attr("r",(d)->
    d )
  .attr("fill", "yellow")
  .attr("stroke", "orange")
  .attr("stroke-width", "10px")


chart = d3.select("#graph")
  .append("svg")
  .attr("width",w)
  .attr("height",h)

chart.selectAll("rect")
  .data(dataset)
  .enter()
  .append("rect")
  .attr("x", (d, i) -> i * w / dataset.length)
  .attr("y", (d) -> h - (d*4))
  .attr("width", w / dataset.length - barPadding)
  .attr("height", (d) -> d * 4)
  .attr("fill", (d) -> "rgb(0, 0, #{(d * 10)})")

