class Node
  attr_accessor :char, :neighbors

  def initialize(char)
    @char = char
    @neighbors = []
  end

  def add_neighbor(num)
    @neighbors << num
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_nodes(char)
    @nodes << Node.new(char)
  end

  def find_node_by_char(char)
    nodes.each do |n|
      return n if n.char == char
    end
    nil
  end

  def count
    nodes.length
  end
end