$(document).ready ->
  w = $('#geo-map').height()
  h = $('#geo-map').width()

  chartH   = $('#geo-graph').height()
  chartW   = $('#geo-graph').width()
  hueStep  = 4
  barPad   = 90
  barSize  = chartH / (geoMapData.features.length )

  clickCount = (d) -> if d.clicks then d.clicks else 0
  mapColor   = (d) -> "rgb(220, #{220-clickCount(d)*hueStep}, #{220-clickCount(d)*hueStep})"
  titleColor = (d) -> "rgb(#{clickCount(d)*hueStep},#{clickCount(d)*hueStep},#{clickCount(d)*hueStep})"

  xy     = d3.geo.albersUsa().scale(1000)#.translate([325,200])
  path   = d3.geo.path().projection(xy)
  svg    = d3.select("#geo-map").append("svg")
  states = svg.append("g").attr("id", "states")
  chart  = d3.select("#geo-graph").append("svg")
  bars   = chart.append("g").attr("id","bars")
  counts = chart.append("g").attr("id","counts")
  titles = chart.append("g").attr("id","titles")

  states.selectAll("path")
    .data(geoMapData.features)
    .enter().append("path")
    .attr("d", path)
    .attr('fill', '#ccc')
    .attr('stroke', 'white')

  d3.selectAll("#geo-map path").on "click", ->
    d3.select(@).transition().duration("300").attr('fill', (d) ->
      d.clicks or= 0
      d.clicks += 1
      updateChart(d)
      mapColor(d))

  bars.selectAll('rect')
    .data(geoMapData.features)
    .enter()
    .append("rect")
    .attr("x", (d, i) -> barPad + clickCount(d) * 4 )#i * barSize)
    .attr("y", (d, i) -> i * barSize )
    .attr("width", (d) -> clickCount(d) * 4)
    .attr("height", barSize - 1)
    .attr("id", (d)  -> d.properties.name)
    .attr("fill", (d)   -> mapColor(d))

  counts.selectAll('text')
    .data(geoMapData.features)
    .enter()
    .append("text")
    .attr("x", (d, i) -> clickCount(d) * 4 )#i * barSize)
    .attr("y", (d, i) -> i * barSize + 8 )
    .attr("font-family", "helvetica")
    .attr("font-size", "10px")
    .attr("fill", "black")
    .attr('id', (d) -> d.properties.name)

  titles.selectAll('text')
    .data(geoMapData.features)
    .enter()
    .append("text")
    .text((d) -> "#{d.properties.name}")
    .attr("x", (d, i) -> clickCount(d) * 4 )#i * barSize)
    .attr("y", (d, i) -> i * barSize + 8 )
    .attr("font-family", "helvetica")
    .attr("font-size", "10px")
    .attr("fill", "#444444")
    .attr("id",(d) -> d.properties.name)

  updateChart = (d) ->
    d3.select("#bars rect[id='#{d.properties.name}']").transition().duration(400)
      .attr("width", (d) -> d.clicks * 4)
      .attr('fill', (d) -> mapColor(d) )
    d3.select("#counts text[id='#{d.properties.name}']").transition().duration(400)
      .text((d) -> "#{d.clicks}")
      .attr("x", (d) -> d.clicks * 4 + barPad + 8)


