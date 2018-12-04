require 'benchmark'
require_relative 'makegraph.rb'
require_relative 'graph_strings.rb'
require_relative 'word_hash.rb'
require_relative 'find_word.rb'

words = nil
Benchmark.bm(15) do |bm|
    bm.report("ultra big:") do
        wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        graph = make_graph ["ultra_big_graph.txt"]
        word_hash = Word_Hash.new(wordlist)
        collector = StringCollector.new
        graph_strings(graph, collector)
        words = find_word(collector.strings, word_hash)
        words = words.sort_by(&:length)
        len = words[-1].length
        words = words.select{|a| a.length >= len}
    end
    puts words
    bm.report("big:") do
        wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        graph = make_graph ["big_graph.txt"]
        word_hash = Word_Hash.new(wordlist)
        collector = StringCollector.new
        graph_strings(graph, collector)
        words = find_word(collector.strings, word_hash)
        words = words.sort_by(&:length)
        len = words[-1].length
        words = words.select{|a| a.length >= len}
    end
    puts words
    bm.report("medium:") do
        wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        graph = make_graph ["medium_size_graph.txt"]
        word_hash = Word_Hash.new(wordlist)
        collector = StringCollector.new
        graph_strings(graph, collector)
        words = find_word(collector.strings, word_hash)
        words = words.sort_by(&:length)
        len = words[-1].length
        words = words.select{|a| a.length >= len}
    end
    puts words
    bm.report("small:") do
        wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        graph = make_graph ["small_graph.txt"]
        word_hash = Word_Hash.new(wordlist)
        collector = StringCollector.new
        graph_strings(graph, collector)
        words = find_word(collector.strings, word_hash)
        words = words.sort_by(&:length)
        len = words[-1].length
        words = words.select{|a| a.length >= len}
    end
    puts words
end