# Make the word_hash from wordlist.txt
class WordHash
  def initialize(wordlist)
    @hash = {}
    wordlist.each do |word|
      alpha = word.chars.sort.join
      if @hash.key? alpha
        @hash[alpha] << word
      else
        @hash.store(alpha, [word])
      end
    end
  end

  def check(key)
    @hash.key? key
  end

  def get(key)
    @hash[key]
  end
end
