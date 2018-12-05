class Word_Hash
  def initialize(wordlist)
    @hash = Hash::new
    wordlist.each do |word|
      alpha = word.chars.sort.join
      if(@hash.has_key? alpha)
        @hash[alpha] << word
      else
        @hash.store(alpha, [word])
      end
    end
  end

  def check(key)
    @hash.has_key? key
  end

  def get(key)
    @hash[key]
  end
end