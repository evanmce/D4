require_relative 'makegraph.rb'
def main
  if File.file?(ARGV[0])
    make_graph ARGV
  else
    print_usage_statement
    exit 1
  end
end

def print_usage_statement
  puts 
end

main if $PROGRAM_NAME == __FILE__
