require 'minitest'
require 'minitest/autorun'
require_relative 'word_hash.rb'


class TestWordHash < Minitest::Test
    def test_alpha_insert
        test_hash = Word_Hash.new(['bcda'])
        assert_equal test_hash.check('abcd'), true
    end

    def test_multiple_insert
        test_hash = Word_Hash.new(['bcda', 'cbda'])
        assert_equal test_hash.get('abcd'), ['bcda', 'cbda']
    end
end