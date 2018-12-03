# Get them strings
class StringCollector
  attr_accessor :strings

  def initialize
    @strings = []
  end

  def call(*nodeHistory)
    strings << nodeHistory[0]
  end
end

def graph_strings(in_graph, callback)
  in_graph.nodes.map do |node|
    callback.call([node])
    breath_first_search(node, [node], callback)
  end
end

def breath_first_search(node, prefix, callback)
  node.neighbors.each do |n|
    callback.call(prefix.clone() << n)
  end
  node.neighbors.each do |n|
    breath_first_search(n, prefix.clone() << n, callback)
  end
end
