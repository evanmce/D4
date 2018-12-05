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
    graph.display
    collector = WordCollector.new(wordlist)
    graph_strings(graph, collector)
    collector.done
    words = collector.strings
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
