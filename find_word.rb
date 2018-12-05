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
