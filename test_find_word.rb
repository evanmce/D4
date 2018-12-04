require 'minitest'
require 'minitest/autorun'
require_relative 'word_hash.rb'
require_relative 'find_word.rb'

class TestFindWord < Minitest::Test
    def setup
        @wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
        @wordhash = Word_Hash.new(wordlist)
    end

    def test_finds_longest
        words = find_word()
    end
end