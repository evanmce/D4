require 'minitest'
require 'minitest/autorun'
require_relative 'graph_strings.rb'
require_relative 'makegraph.rb'


class TestGraphStrings < Minitest::Test
    def setup
        @graph = make_graph(['small_graph.txt'])
        @wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        @collector = WordCollector.new(@wordlist)
    end

    def test_collector_contains_possible_strings
        graph_strings(@graph, @collector)
        @collector.done
        assert_includes @collector.strings, 'cake'
    end

    def test_graph_with_no_connections_gets_number_of_nodes
        test_graph = make_graph(['test_graph.txt'])
        test_collc = WordCollector.new(@wordlist)
        graph_strings(test_graph, test_collc)
        test_collc.done
        assert_equal test_collc.strings.length, 3
    end

    def test_graph_with_disjoint_connections_gets_total_number_of_nodes
        disjoint_graph = make_graph(['disjoint_graph.txt'])
        disjoint_collc = WordCollector.new(@wordlist)
        graph_strings(disjoint_graph, disjoint_collc)
        disjoint_collc.done
        assert_equal disjoint_collc.strings.length, 3
    end
end