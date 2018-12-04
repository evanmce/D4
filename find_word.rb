def find_word(prefixes, word_hash)
  sorted = prefixes.map{|p| p.chars.map(&:downcase).sort.join}
  valid_alphastrings = sorted.select{|s| word_hash.check(s)}
  words = valid_alphastrings.map{|a| word_hash.get(a)}
  words.flatten
end

def nodes_to_string(nodes)
  nodes.map{ |n| n::letter }.map{|n| n::downcase}.reduce{ |a, b| a + b }
end
