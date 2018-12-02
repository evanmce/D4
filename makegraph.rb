require_relative 'graph.rb'

def make_graph(arg)
  graph = Graph.new
  size = `wc -l #{arg[0]}`.to_i
  (1..size).each do |name|
    graph.nodes << Node.new(name)
  end
  File.open(arg[0], 'r').each do |line|
    number, char = /(?<number>\d{1});(?<char>\w{1});/.match(line).captures
    graph.nodes[number.to_i - 1].set_letter(char)
    line = line.sub(/(?<number>\d{1});(?<char>\w{1});/, '')
    nums = []
    nums << line.scan(/(\d),*/)
    nums.each do |neighbors|
      neighbors.each do |neighbor|
        graph.nodes[number.to_i - 1].neighbors << graph.nodes[neighbor[0].to_i - 1]
      end
    end
  end

  graph.display
  graph
end
