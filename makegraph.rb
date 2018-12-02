require_relative 'graph.rb'

def make_graph(arg)
  graph = Graph.new
  File.open(arg[0], 'r').each do |line|
    number, char = /(?<number>\d{1});(?<char>\w{1});/.match(line).captures
    puts number
    puts char
    graph.nodes << Node.new(number, char)
  end
end
