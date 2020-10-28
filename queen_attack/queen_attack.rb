class Queens
	def initialize(white = nil, black = nil)
		begin
	    @white = white
	    @black = black
	  raise ArgumentError, "You don't enter a position." if correct_value?	 
	  rescue => mes
	  	p mes
	  end
  end

  def create_field
  	n = 8
  	array = Array.new(n) { |i| Array.new(n) { |i| "_" }}
  	for i in 0..n
	  	for j in 0..n
	  			array[@white[0]][@white[1]] = "W"
	  			array[@black[0]][@black[1]] = "B"
	  	end
	  end
  	print_array(array)
  	puts attack?
  end

  private

  def correct_value?
    @black == nil || @black.all? { |i| i >= 0 && i <= 7 } 
    @white == nil || @white.all? { |i| i >= 0 && i <= 7 }
  end

  def attack?
    same_row? || same_col? || same_diag?
  end

  def same_row?
    @white[0] == @black[0]
  end

  def same_col?
  	@white[1] == @black[1]
  end

  def same_diag?
  	(@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
  end

  def print_array(array)
  	array.each do |line|
			line.each do |elem|
				print elem 
			end
			print "\n"
	  end
	  puts ""
  end
end


#qa = Queens.new(white = [5, 6], black = [7, 4])	
qa = Queens.new(white = [4, 6], black = [4, 4])	
#qa = Queens.new(black = [1, 1])
#qa = Queens.new( white = [2, 4])
qa.create_field

