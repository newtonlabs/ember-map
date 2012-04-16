dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13, 11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ]

w = 500
h = 200
barPadding = 1

svg = d3.select("#learn #graph")
  .append("svg")
  .attr("width",w)
  .attr("height",h)

drag = d3.behavior.drag()
  .on("drag", (d,i) ->
    d.x += d3.event.dx
    d.y += d3.event.dy
    d3.select(this).attr("transform", (d,i) ->
      return "translate(" + [ d.x, d.y] + ")"))

# drag = d3.behavior.drag()
#   .on("drag", (d,i) ->
#     d += -d3.event.dy
#     console.log d
#     console.log(dataset)
#     # newX = i * w / dataset.length
#     # newX = $(@).attr "x"
#     # newY = h - d
#     # console.log("d = #{d}, d.x = #{newY}, d.y = #{newY}")
#     # console.log("d = #{d}"))
#     # x = i * w / dataset.length
#     # y = d3.event.dy
#     d3.select(this).attr("transform", (d,i) ->
#       console.log()))
#       # console.log("d.x = #{d.x}, d.y = #{d.y}")
#       # return "translate(" + [ x,y] + ")"))

rect = svg.selectAll("rect")
  .data([{x: 0, y: 0}])
  .enter().append("rect")
  .attr("width", 100)
  .attr("height", 100)
  .style("fill", "#f00")
  .call(drag);
# svg.selectAll("rect")
#   .data(dataset)
#   .enter()
#   .append("rect")
#   .attr("x", (d, i) -> i * w / dataset.length)
#   .attr("y", (d) -> h - (d*4))
#   .attr("width", w / dataset.length - barPadding)
#   .attr("height", (d) -> d * 4)
#   .attr("fill", (d) ->
#     tint = d * 10
#     "rgb(100,#{tint},100)")
#   .call(drag)

# svg.selectAll("rect")
#   .data(dataset)
#   .enter()
#   .append("rect")
#   .attr("x", (d, i) ->
#     i * w / dataset.length)
#   .attr("y", (d) -> h - (d))
#   .attr("width", w / dataset.length - barPadding)
#   .attr("height", (d) -> d )
#   .attr("fill", (d) ->
#     tint = d * 10
#     "rgb(100,#{tint},100)")
#   .call(drag)

# updateColumn = (rect, height, d) ->
#   console.log("d = #{d} moved = #{height} rect = #{rect}")
#   d = height + d
#   d3.select(rect).attr("height", d*4)
#   d3.select(rect).attr("y", h-(d*4))

# chart.selectAll("rect").call(d3.behavior.drag().on("drag", (d) ->
#   updateColumn(@, d3.event.dy, d)))
  # console.log(d3.event.dy)
  # console.log(@)))
  # .attr("y", (h - (d*4)) + d3.event.dy)))

# d3.select("#color button.red").on "click", ->
#   chart.selectAll("rect").transition().duration("500").attr("fill", (d) -> "rgb(#{(d * 10)}, 0, 0)")

# d3.select("#color button.blue").on "click", ->
#   chart.selectAll("rect").transition().duration("500").attr("fill", (d) -> "rgb(0, 0, #{(d * 10)})")

# d3.select("#color button.green").on "click", ->
#   chart.selectAll("rect").transition().duration("500").attr("fill", (d) -> "rgb(0, #{(d * 10)}, 0)")


# svg = d3.select("#circles")
#   .append("svg")
#   .attr("width", w)
#   .attr("height", h);

# circles = svg.selectAll("circle")
#   .data(dataset)
#   .enter()
#   .append("circle")

# circles
#   .attr("cx",(d,i) ->
#     return (i * 50) + 25 )
#   .attr("cy", h/2)
#   .attr("r",(d)->
#     d )
#   .attr("fill", "yellow")
#   .attr("stroke", "orange")
#   .attr("stroke-width", "10px")