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

Benchmark.bm(15) do |benchmark|
    benchmark.report("Wordlist") do
        wordlist = File.open("wordlist.txt", "r").readlines
    end

    benchmark.report("Prefix Word Hash") do
        prefix_hash = Word_Hash.new(wordlist, true)
        word_hash = Word_Hash.new(wordlist, false)
    end

    collector = StringCollector.new

    benchmark.report("Make Graph") do
        graph = make_graph(['ultra_big_graph.txt'])
    end

    benchmark.report("Graph Strings") do
        graph_strings(graph, collector)
    end

    benchmark.report("Find Word") do
        words = find_word(collector.strings, word_hash, prefix_hash)
        puts words
    end

    
end
    



    



    



   


    
