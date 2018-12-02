require 'minitest/autorun'
require_relative 'graph.rb'

class TestGraph < Minitest::Test
  def test_init_node_has_specified_values
    test_node = Node.new(1, 'A')
    assert_equal test_node.node_id, 1
    assert_equal test_node.letter, ['A']
  end

  def test_neighbors_links_nodes
    graph = Graph.new
    node_a = Node.new(1, 'A')
    node_b = Node.new(2, 'B')
    node_c = Node.new(3, 'C')
    node_b.neighbors << node_c
    node_a.neighbors << node_b
    assert_equal node_a.neighbors[0].neighbors[0], node_c
  end
end