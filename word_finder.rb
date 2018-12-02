require_relative 'makegraph.rb'
<<<<<<< HEAD
=======
require_relative 'graph_strings.rb'
>>>>>>> a3052b331281bc27e633737cf027f8f4d8646ddb

def validate_args(args)
  args.count == 1
rescue StandardError
  false
end

def main
  valid_args = validate_args ARGV
  if valid_args && File.file?(ARGV[0])
    graph = make_graph ARGV
    graph_strings(graph, collector)
  else
    print_usage_statement
    exit 1
  end
end

def collector(string)
  puts string
end

def print_usage_statement
  puts 'Usage:'
  puts 'ruby word_finder.rb *graph_file*'
end

main if $PROGRAM_NAME == __FILE__
