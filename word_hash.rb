class Word_Hash
  def initialize(wordlist, isPrefix)
    @hash = Hash::new
    if (isPrefix)
      wordlist.each do |word|
        concatinator = ""
        word.split("").each do |char|
          concatinator = concatinator + char
          hash[concatinator] = true
        end
      end
    else
      wordlist.each do |word|
        hash[word] = true
      end
    end
  end

  def check(key)
    @hash.has_key? key
  end
end