dataset = [
  [5, 20], [480, 90], [250, 50], [100, 33], [330, 95],
  [410, 12], [475, 44], [25, 67], [85, 21], [220, 88]
];

w = 600
h = 100

chart = d3.select("#scatter #graph")
  .append("svg")
  .attr("width",w)
  .attr("height",h)

chart.selectAll('circle')
  .data(dataset)
  .enter()
  .append('circle')
  .attr('cx', (d) -> d[0])
  .attr('cy', (d) -> d[1])
  .attr('r',  (d) -> Math.sqrt(h - d[1]))
  .attr('fill', 'black')

chart.selectAll('text')
  .data(dataset)
  .enter()
  .append('text')
  .text( (d) -> return "#{d[0]},#{d[1]}")
  .attr("x", (d) -> d[0])
  .attr("y", (d) -> d[1])
  .attr("font-family", "sans-serif")
  .attr("font-size", "11px")
  .attr("fill", "blue");
