require_relative 'find_word.rb'
require_relative 'word_hash.rb'

# Get them strings
class WordCollector
  attr_accessor :strings

  def initialize(wordlist)
    @word_hash = Word_Hash.new(wordlist)
    @input = Queue.new
    @output = Queue.new
    @find_word_thread = find_word_thread(@word_hash, @input, @output)
    @strings = []
  end

  def call(*nodeHistory)
    @input << nodeHistory[0]
  end

  def done
    @input << nil
    words = []
    while word = @output.pop
      break if word.nil?
      words << word
    end
    words = words.flatten.sort_by{|x| x.length}
    len = words[-1].length
    @strings = words.select{|x| x.length >= len}
  end
end

def graph_strings(in_graph, callback)
  in_graph.nodes.map do |node|
    callback.call(node.letter)
    breath_first_search(node, node.letter, callback)
  end
end

def breath_first_search(node, prefix, callback)
  node.neighbors.each do |n|
    callback.call(prefix + n.letter)
  end
  node.neighbors.each do |n|
    breath_first_search(n, prefix + n.letter, callback)
  end
end
