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

    benchmark.report("Word Hash") do
        word_hash = Word_Hash.new(wordlist)
    end

    collector = StringCollector.new

    benchmark.report("Make Graph") do
        graph = make_graph(['ultra_big_graph.txt'])
    end

    benchmark.report("Graph Strings") do
        graph_strings(graph, collector)
        strings = collector.strings
    end

    strings = strings.select{|x| !x.nil?}

    benchmark.report("Find Word") do
        words = find_word(strings, word_hash)
        puts words
    end

    
end
    



    



    



   


    
