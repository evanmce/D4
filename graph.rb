# Nodes for the graph
class Node
  attr_accessor :node_id, :letter, :neighbors

  def initialize(node_id, *letter)
    @node_id = node_id
    @neighbors = []
    @letter = letter unless letter.nil?
  end

  def add_neighbor(node_id)
    @neighbors << node_id
  end
end

# Graph object
class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_nodes(letter)
    @nodes << Node.new(node_id, letter)
  end

  def find_node_by_letter(letter)
    nodes.each do |n|
      return n if n.letter == letter
    end
    nil
  end

  def count
    nodes.length
  end

  def display
    @nodes.each do |n|
      puts "Starting from Node #{n.node_id}: #{n.letter} - #{n.neighbors}"
    end
  end
end
