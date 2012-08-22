$(document).ready ->
  node = undefined
  link = undefined
  root = undefined
  flatten = (root) ->
    recurse = (node) ->
      node.children.forEach recurse  if node.children
      node.id = ++i  unless node.id
      nodes.push node
    nodes = []
    i = 0
    recurse root
    nodes

  # console.log(readme)
  nodes = flatten(readme)
  # console.log(nodes)
  links = d3.layout.tree().links(nodes)
  console.log(links)

