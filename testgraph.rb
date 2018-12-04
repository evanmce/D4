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

  def test_links_ret_correct_string
    graph = Graph.new
    node_a = Node.new(1, 'A')
    node_b = Node.new(2, 'B')
    node_c = Node.new(3, 'C')
    node_d = Node.new(4, 'D')
    node_a.neighbors << node_b
    node_b.neighbors << node_c
    node_b.neighbors << node_d
    assert_equal graph.links(node_a.neighbors), '2'
    assert_equal graph.links(node_b.neighbors), '3,4'
    assert_equal graph.links(node_d.neighbors), '---'
  end
end