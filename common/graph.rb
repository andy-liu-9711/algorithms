require_relative 'node'

class Graph
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def add_node(node)

    node = Node.new(node) if !(node.instance_of? Node)
    @nodes << node

    node
  end

  def add_edge(node1, node2)
    node1.add_neighbor(node2)
    node2.add_neighbor(node1)
  end

  def to_s
    @nodes.reduce("") {|accumulator, val| accumulator << "#{val}"}
  end
end
