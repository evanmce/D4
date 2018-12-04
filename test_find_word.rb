require 'minitest'
require 'minitest/autorun'
require_relative 'word_hash.rb'
require_relative 'find_word.rb'
require_relative 'graph.rb'

class TestFindWord < Minitest::Test
    def setup
        @wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        @wordhash = Word_Hash.new(@wordlist)
    end

    def test_finds_longest
        words = find_word(['cake', 'l', 'b', 'xvc'], @wordhash)
        assert_equal ['cake'], words
    end

    def test_finds_multiple
        words = find_word(['graph', 'wrong', 'left'], @wordhash)
        assert_equal ['graph', 'grown', 'wrong'], words
    end

    def test_nodes_to_string
        assert_equal 'test', nodes_to_string([Node.new(0, 'T'),Node.new(1, 'E'),Node.new(2, 'S'),Node.new(3, 'T')])
    end
end