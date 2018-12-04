require_relative 'graph.rb'

def make_graph(arg)
  graph = Graph.new
  file = File.open(arg[0], 'r').readlines
  size = file.count
  (1..size).each do |name|
    graph.nodes << Node.new(name)
  end
  file.each do |line|
    number, char = /(?<number>\d+);(?<char>\w{1});/.match(line).captures
    graph.nodes[number.to_i - 1].letter = char
    line = line.sub(/(?<number>\d+);(?<char>\w{1});/, '')
    nums = []
    nums << line.scan(/(\d+),*/)
    nums.each do |neighbors|
      neighbors.select{|x| x[0].to_i < size}
      neighbors.each do |neighbor|
        graph.nodes[number.to_i - 1].neighbors << graph.nodes[neighbor[0].to_i - 1]
      end
    end
  end
  graph
end
