require_relative 'graph.rb'

def make_graph(arg)
  graph = Graph.new
  size = `wc -l #{arg[0]}`.to_i
  (1..size).forEach do |name|
    graph.nodes << Node.new(name)
  end
  File.open(arg[0], 'r').each do |line|
    number, char = /(?<number>\d{1});(?<char>\w{1});/.match(line).captures
    graph.nodes[number - 1].set_letter(char)
    line = line.sub(/(?<number>\d{1});(?<char>\w{1});/, '')
    nums = []
    nums << line.scan(/(\d),*/)
    nums.forEach do |neighbor|
      graph.nodes[number - 1].neighbors << graph.nodes[neighbor.to_i - 1]
    end
  end

  graph.display
  graph
end
