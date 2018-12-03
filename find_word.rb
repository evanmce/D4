def find_word(prefixes, word_hash, prefix_hash)
  tries = prefixes.select{ |prefix| prefix_hash.check(nodes_to_string(prefix))}
  words = []
  puts tries.count
  while (tries != [])
    nextTries = []
    tries.each do |try|
      used_ids = try.map{|n| n::node_id}
      valid_paths = prefixes.select do |prefix|
        prefix.map{|p| !used_ids.include?(p::node_id)}.reduce(&:&) && prefix_hash.check(nodes_to_string(try.clone().push(*prefix)))
      end
      valid_paths.each do |path|
        nextTries << try.clone().push(*path)
      end
    end

    tries = nextTries
    tries.each do |try|
      if word_hash.check(nodes_to_string(try))
        words << nodes_to_string(try)
      end
    end
  end
  words
end

def nodes_to_string(nodes)
  nodes.map{ |n| n::letter }.map{|n| n::downcase}.reduce{ |a, b| a + b }
end
