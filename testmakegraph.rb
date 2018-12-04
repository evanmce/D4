require 'minitest/autorun'
require_relative 'makegraph'

class TestMakeGraph < Minitest::Test
  def test_if_graph_has_nodes_equal_to_lines_in_file
    graph = make_graph(['test_graph.txt'])
    assert_equal graph.nodes.length, 3
  end

  def test_connections_for_disjointed_graph
    graph = make_graph(['test_graph.txt'])
    assert_equal graph.nodes[0].neighbors.length, 0
    assert_equal graph.nodes[1].neighbors.length, 0
    assert_equal graph.nodes[2].neighbors.length, 0
  end
end