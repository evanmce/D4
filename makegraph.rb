require_relative 'graph.rb'

def make_graph(arg)
  graph = Graph.new
  File.open(arg[0], 'r').each do |line|
    number, char = /(?<number>\d{1});(?<char>\w{1});/.match(line).captures
    node = Node.new(number, char)
    line = line.sub(/(?<number>\d{1});(?<char>\w{1});/, '')
    node.neighbors << line.scan(/(\d),*/)
    graph.nodes << node
  end

  graph.display
  graph
end
