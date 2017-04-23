class Node
  attr_reader :val, :neighbors
  attr_writer :visited

  def initialize(val)
    @val = val
    @neighbors = []
    @visited = false
  end

  def add_neighbor(node)
    neighbors << node
  end

  def visited?
    @visited
  end

  def to_s
    "#{val}"
  end
end
