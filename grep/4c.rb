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
    if flags.size == 1
      # without flags
      found << line.chomp if no_flag?(line)

      # with flag -n
      found << "#{file}: #{index+1}: #{line}" if flag_n?(line)

      #with flag -l
      found << file if flag_l?(line)

      #with flag -i
      found << line.chomp if flag_i?(line) 

      #with flag -x
      found << line.chomp if flag_x?(line)

      #with flag -v
      found << line.chomp if flag_v?(line)
    elsif flags.size == 2
      found << "#{file}: #{index+1}: #{line}" if flag_i_n?(line)
    end   
  end
end
check(found)
end

def flag_i_n?(line)
  if flags.include?('-n') && flags.include?('-i')
    line.downcase.include? word.downcase
  end
end

def check(found)
  if flags.include?('-l')
    found.uniq
  else 
    found 
  end
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

def flag_l?(line)
  if flags.include?('-l') && line.include?(word)
      files.size > 1
  end
end

def flag_i?(line)
  if flags.include?('-i')
    line.downcase.include? word.downcase
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



hi = Grep.new("Hello", ["-n", "-i"], ["input.txt", "input2.txt"])


puts hi.grep()#.join("\n")





