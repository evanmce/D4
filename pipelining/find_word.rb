def find_word(prefixes, word_hash)
  sorted = prefixes.map{|p| p.chars.map(&:downcase).sort.join}
  valid_alphastrings = sorted.select{|s| word_hash.check(s)}
  words = valid_alphastrings.map{|a| word_hash.get(a)}
  words = words.flatten
  words = words.sort_by(&:length)
  len = words[-1].length
  words.select{|a| a.length >= len}
end

def nodes_to_string(nodes)
  nodes.map{ |n| n::letter }.map{|n| n::downcase}.reduce{ |a, b| a + b }
end

def find_word_thread(word_hash, input, output)
  Thread.new do
    while prefix = input.pop
      break if prefix.nil?
      sorted = prefix.chars.map(&:downcase).sort.join
      if word_hash.check(sorted)
        output << word_hash.get(sorted) 
      end
    end
    output << nil
  end
end
