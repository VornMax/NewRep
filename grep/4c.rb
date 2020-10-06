class Grep

attr_reader :word, :flags, :files

def initialize(word, flags, files)
	@word = word
	@flags = flags
	@files = files
end



def grep()
found = []
files.each do |file|
  File.readlines(file).each_with_index do |line, index|

    # without flags
    found << line.chomp if no_flag?(line)

    # with flag -n
    found << "#{file}: #{index+1}: #{line}" if flag_n?(line)

    #with flag -l
    found << file if flag_l?

    #with flag -i
    found << line.chomp if flag_i?(line) 

    #with flag -x
    found << line.chomp if flag_x?(line)

    #with flag -v
    found << line.chomp if flag_v?(line)
        
  end
end
found
end

def no_flag?(line)
  if flags.include?('')
    line.include? word
  end
end

def flag_n?(line)
  if flags.include?('-n')
    line.include? word
  end
end

def flag_l?
  if flags.include?('-l')
     files.size > 1
  end
end

def flag_i?(line)
  if flags.include?('-i')
    line.downcase.include? word
  end
end

def flag_x?(line)
  if flags.include?('-x')
    line.strip.chomp == word 
  end
end

def flag_v?(line)
	if flags.include?('-v') 
    unless line.include? word 
      line
    end
  end
end



end



hi = Grep.new("hello", ["-v"], ["input.txt", "input2.txt"])


puts hi.grep()#.join("\n")





