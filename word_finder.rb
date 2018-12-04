require_relative 'makegraph.rb'
require_relative 'graph_strings.rb'
require_relative 'word_hash.rb'
require_relative 'find_word.rb'

def validate_args(args)
  args.count == 1
rescue StandardError
  false
end

def main
  valid_args = validate_args ARGV
  if valid_args && File.file?(ARGV[0])
    wordlist = File.open('wordlist.txt', 'r').readlines.map{|line| line.split("\n")[0]}
    graph = make_graph ARGV
    prefix_hash = Word_Hash.new(wordlist, true)
    word_hash = Word_Hash.new(wordlist, false)
    collector = StringCollector.new
    graph_strings(graph, collector)
    puts collector.strings
    words = find_word(collector.strings, word_hash, prefix_hash)
    words = words.sort_by(&:length)
    len = words[-1].length
    words = words.select{|a| a.length >= len}
    puts words
  else
    print_usage_statement
    exit 1
  end
end

def print_usage_statement
  puts 'Usage:'
  puts 'ruby word_finder.rb *graph_file*'
end

main if $PROGRAM_NAME == __FILE__
