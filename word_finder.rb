require_relative 'makegraph.rb'
rew

def validate_args(args)
  args.count == 1
rescue StandardError
  false
end

def main
  valid_args = validate_args ARGV
  if valid_args && File.file?(ARGV[0])
    make_graph ARGV
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
