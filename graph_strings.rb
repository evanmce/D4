def graph_strings(Graph, callback)
    Graph::nodes.map do |node|
        callback(node::letter)
        breath_first_search(node, node::letter, callback)
    end
end

def breath_first_search(node, prefix, callback)
    node::neighbors.each do |n| 
        callback(prefix + n::letter)
    end
    node::neighbors.each do |n|
        breath_first_search(n, prefix + n::letter, callback)
    end
end







