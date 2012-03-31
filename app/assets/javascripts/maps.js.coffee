$(document).ready ->
  paper  = Raphael(200, 200, 320, 200)
  circle = paper.circle(100,100,100)
  circle.attr("fill", "red")
  circle.attr("stroke", "blue")
