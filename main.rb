def main
  if File.file?(ARGV[0])
    File.open(ARGV[0], 'r').each do |line|
      puts line
    end
  else
    puts 'isn\'t a file'
    exit 1
  end
end

main if $PROGRAM_NAME == __FILE__
