class Word_Hash
  def initialize(wordlist, isPrefix)
    @isPrefix = isPrefix
    @hash = Hash::new
    if (isPrefix)
      wordlist.each do |word|
        concatinator = ""
        word.split("").each do |char|
          concatinator = concatinator + char
          @hash.store(concatinator, 1)
        end
      end
    else
      wordlist.each do |word|
        @hash.store(word, 1)
      end
    end
  end

  def check(key)
    if (!@isPrefix)
      puts key
      puts @hash.has_key? key
    end
    @hash.has_key? key
  end
end