def graph_strings(in_graph, callback)
    in_graph::nodes.map do |node|
        callback.call(node::letter)
        breath_first_search(node, node::letter, callback)
    end
end

def breath_first_search(node, prefix, callback)
    node::neighbors.each do |n| 
        callback.call(prefix + n::letter)
    end
    node::neighbors.each do |n|
        breath_first_search(n, prefix + n::letter, callback)
    end
end







