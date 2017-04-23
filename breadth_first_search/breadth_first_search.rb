require_relative '../common/graph'

def breadth_first_search(source)
  queue = [source]
  visit_path = []

  while !queue.empty?
    node = queue.shift
    node.visited = true

    visit_path << node.val

    node.neighbors.select{|n| !n.visited?}.each do |n|
      queue << n if queue.index{|item| item.val == n.val}.nil?
    end
  end

  visit_path
end

graph = Graph.new

nodeA = graph.add_node("a")
nodeB = graph.add_node("b")
nodeC = graph.add_node("c")
nodeD = graph.add_node("d")
nodeE = graph.add_node("e")
nodeF = graph.add_node("f")
nodeG = graph.add_node("g")
nodeH = graph.add_node("h")

graph.add_edge(nodeA, nodeB)
graph.add_edge(nodeA, nodeC)
graph.add_edge(nodeB, nodeD)
graph.add_edge(nodeB, nodeE)
graph.add_edge(nodeC, nodeF)
graph.add_edge(nodeC, nodeG)
graph.add_edge(nodeE, nodeH)
graph.add_edge(nodeE, nodeF)
graph.add_edge(nodeF, nodeG)

p breadth_first_search(nodeA)
