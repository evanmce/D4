class Word_Hash
  def initialize(wordlist, isPrefix)
    @isPrefix = isPrefix
    @hash = Hash::new
    if (isPrefix)
      wordlist.each do |word|
        concatinator = ""
        word.split("").each do |char|
          concatinator = concatinator + char
          concatinator = concatinator.chars.sort.join
          @hash.store(concatinator, 1)
        end
      end
    else
      wordlist.each do |word|
        alpha = word.chars.sort.join
        if(@hash.has_key? alpha)
          @hash[alpha] << word
        else
          @hash.store(alpha, [word])
        end
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