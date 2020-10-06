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
      if line.include? word 
        result = line.chomp
        result = "#{index+1}:#{line}" if flag_n?
        result = "#{file}: " + result if files.size > 1
   		result = file if flag_l?
        result = line.chomp unless line.include? word 
      elsif flag_v?
     	result = line.chomp unless line.include? word
	  end
	  found << result
	end
	found
  end
end
  
def search_flags(line)
	if no_flag?
		return line.chomp if line.include? word 
	end
end


def no_flag?
	flags.include?('')
end

def flag_n?
   flags.include?('-n')
end

def flag_l?
   flags.include?('-l')
end

def flag_i?
   flags.include?('-i')
end

def flag_x?
	flags.include?('-l')
end

def flag_v?
	flags.include?('-v')
end



end



hi = Grep.new("hello", ["-v"], ["input.txt"])


puts hi.grep()#.join("\n")





