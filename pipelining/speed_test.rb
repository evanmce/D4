require 'flamegraph'
require 'benchmark'
require_relative 'makegraph.rb'
require_relative 'graph_strings.rb'
require_relative 'find_word.rb'
require_relative 'word_hash.rb'


wordlist = nil
graph = nil
strings = nil
prefix_hash = nil
word_hash = nil

Flamegraph.generate('load_wordlist.html') do
    wordlist = File.open("wordlist.txt", "r").readlines
end

Flamegraph.generate('genarate_word_hash.html') do
    word_hash = Word_Hash.new(wordlist)
end

collector = WordCollector.new(wordlist)

Flamegraph.generate('make_small_graph.html') do
    graph = make_graph(['small_graph.txt'])
end

Flamegraph.generate('strings_small_graph.html') do
    graph_strings(graph, collector)
end

Flamegraph.generate('solve_small_graph.html') do
    collector.done
    words = collector.strings
end

