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
    f = File.open(file, "r").each_with_index do |line, index|
        if line.include? word 
          if flag_n?
            result = "#{index+1}:#{line}" if flag_n?
            result = "#{file}: " + result if files.size > 1
          end

          if flag_l?
            result = file
          end
            
     		  if flag_i?
            result = line.chomp if line.downcase.include? word.downcase 
        	end

          if flag_x?
            result = line.chomp if line.strip.chomp == word 
          end

  	      result = line.chomp
        elsif flag_v?
          result = line.chomp unless line.include? word 
          
  	    end
        found << result
	  end
	  f.close
  end
  found.uniq
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
  flags.include?('-x')
end

def flag_v?
	flags.include?('-v')
end



end



hi = Grep.new("hello", ["-n"], ["input.txt", "input2.txt"])


puts hi.grep()#.join("\n")





