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

    def test_finds_correct_string
        input = Queue.new
        output = Queue.new
        test_thread = find_word_thread(@wordhash, input, output)
        input << 'akec'
        result = output.pop
        assert_equal ['cake'], result
    end

    def test_finds_multiple
        input = Queue.new
        output = Queue.new
        test_thread = find_word_thread(@wordhash, input, output)
        input << 'wrong'
        result = output.pop
        assert_includes result, 'wrong'
        assert_includes result, 'grown'
    end

    def test_finds_none
        input = Queue.new
        output = Queue.new
        test_thread = find_word_thread(@wordhash, input, output)
        input << 'zzzxxxc'
        assert_equal output.empty?, true
    end
end