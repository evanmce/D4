require 'minitest/autorun'
require_relative 'makegraph'

class TestMakeGraph < Minitest::Test
  def setup
    @graph = make_graph(['small_graph.txt'])
  end

  def test_if_graph_has_nodes_equal_to_lines_in_file
    assert_equal @graph.nodes.length, 6
  end
end