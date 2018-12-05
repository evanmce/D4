require 'benchmark'
require 'flamegraph'
require 'yaml'
require_relative 'makegraph.rb'
require_relative 'graph_strings.rb'
require_relative 'word_hash.rb'
require_relative 'find_word.rb'

words = nil
Benchmark.bm(15) do |bm|
    bm.report("ultra big:") do
        wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        graph = make_graph ["ultra_big_graph.txt"]
        word_hash = WordHash.new(wordlist)
        collector = StringCollector.new
        graph_strings(graph, collector)
        words = find_word(collector.strings, word_hash)
    end
    puts words
    bm.report("big:") do
        wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        graph = make_graph ["big_graph.txt"]
        word_hash = WordHash.new(wordlist)
        collector = StringCollector.new
        graph_strings(graph, collector)
        words = find_word(collector.strings, word_hash)
    end
    puts words
    bm.report("medium:") do
        wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        graph = make_graph ["medium_size_graph.txt"]
        word_hash = WordHash.new(wordlist)
        collector = StringCollector.new
        graph_strings(graph, collector)
        words = find_word(collector.strings, word_hash)
    end
    puts words
    bm.report("small:") do
        wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        graph = make_graph ["small_graph.txt"]
        word_hash = WordHash.new(wordlist)
        collector = StringCollector.new
        graph_strings(graph, collector)
        words = find_word(collector.strings, word_hash)
    end
    puts words
end

Flamegraph.generate('full_run.html') do
    wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
    graph = make_graph ["small_graph.txt"]
    word_hash = WordHash.new(wordlist)
    collector = StringCollector.new
    graph_strings(graph, collector)
    words = find_word(collector.strings, word_hash)
    puts words
end