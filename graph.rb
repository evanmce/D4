# Nodes for the graph
class Node
  attr_accessor :node_id, :letter, :neighbors
  def initialize(node_id, *letter)
    @node_id = node_id
    @neighbors = []
    @letter = letter[0] unless letter.nil?
  end
end

# Graph object
class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def links(neighbors)
    to_return = ''
    if !neighbors.empty?
      neighbors.each_with_index do |neighbor, index|
        to_return += neighbor.node_id.to_s
        to_return += ',' unless index == neighbors.size - 1
      end
      to_return
    else
      '---'
    end
  end

  def display
    @nodes.each do |n|
      puts "Starting from Node #{n.node_id}: #{n.letter} - [ #{links(n.neighbors)} ]"
    end
  end
end
