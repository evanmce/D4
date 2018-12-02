# Nodes for the graph
class Node
  attr_accessor :node_id, :letter, :neighbors

  def initialize(node_id, *letter)
    @node_id = node_id
    @neighbors = []
    @letter = letter unless letter.nil?
  end
end

# Graph object
class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def display
    @nodes.each do |n|
      puts "Starting from Node #{n.node_id}: #{n.letter} - #{n.neighbors}"
    end
  end
end
