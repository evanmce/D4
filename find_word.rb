def find_word(prefixes, word_hash, prefix_hash)
  puts prefixes.count
  tries = prefixes.select{ |prefix| prefix_hash.check prefix}
  words = []
  while (tries != []) do
    puts tries.count
    tries = tries.map do |prefix|
      prefixes.select{ |next_string| prefix_hash.check(prefix + next_string) }.map{ |next_string| prefix + next_string}
    end
    tries = tries.flatten
    words << tries.select{ |x| word_hash.check(x)}
    words = words.flatten
  end
  words
end