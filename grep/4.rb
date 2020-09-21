class Grep

def initialize(word, flags, files)
	@files = files
	@flags = flags
	@word = word
end

def flag_n()
	found = []
	i = 0
	f = File.open(files, "r") do |file|
	  file.each do |line| 
	    i += 1
	    found << "#{i}:#{line}" if line.include? word 
	  end
    end
    f.close
    found
end

def flag_l(files, word)
  found = []
  array = file_path.split(" ")
  puts array.to_s
  array.each do |files|
  	f = File.open(files, "r") do |file|
  	  file.each do |line| 
	    found << files if line.include? word 
	  end
	end
	f.close
  end
  found.uniq()
end


def flag_i(file_path, word)
	found = []
	f = File.open(file_path, "r") do |file|
	  file.each do |line| 
	    found << line.chomp if line.downcase.include? word.downcase 
	  end
    end
    f.close
    found
end

def flag_v(file_path, word)
	found = []
	f = File.open(file_path, "r") do |file|
		  file.each do |line| 
		      found << line.chomp unless line.include? word 
		  end

    end
    f.close
    found
end

def flag_x (file_path, word)
  found = []
  f = File.open(file_path, "r") do |file|
	file.each do |line| 
			#str = line.scan word
	  found << line.chomp if line.strip.chomp == word 
	end
  end
  f.close
  found
end

def no_flag(file_path, word)
  found = []
  f = File.open(file_path, "r") do |file|
	file.each do |line| 
			#str = line.scan word
	  found << line.chomp if line.include? word 
	end
  end
  f.close
  found
end

def grep(file_path, word, flags="")
	array 
	case flags
	when "-n"
		flag_n(file_path, word)
	when "-l"
		flag_l(file_path, word)
	when "-i"
		flag_i(file_path, word)
	when "-v"
		flag_v(file_path, word)
	when "-x"
		flag_x(file_path, word)
	else
		no_flag(file_path, word)
	end
  
end

end



hi = Grep.new()


puts hi.grep("input.txt", "hello", "")#.join("\n")





