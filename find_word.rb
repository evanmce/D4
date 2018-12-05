def find_word(prefixes, word_hash)
  sorted = prefixes.map { |p| p.chars.map(&:downcase).sort.join }
  valid_alphastrings = sorted.select { |s| word_hash.check(s) }
  words = valid_alphastrings.map { |a| word_hash.get(a) }
  words = words.flatten
  words = words.sort_by(&:length)
  len = words[-1].length
  words.select { |a| a.length >= len }
end

def nodes_to_string(nodes)
  nodes.map(&:letter).map(&:downcase).reduce { |a, b| a + b }
end
