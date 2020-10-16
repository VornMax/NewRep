class Minesweeper 
  attr_reader :field 

  def initialize(field)
    @field = field
  end

  private

  def print_array(array)
  	array.each do |line|
			line.each do |elem|
				print elem 
			end
			print "\n"
	  end
	  puts ""
  end

  public 

  def check
  	n = field.length-2
  	m = field[0].length-2
  	array = Array.new(n) { |i| Array.new(m) { |i| 0 }}
  	print_array(array)

	  for i in 0...n
	  	for j in 0...m
	  		if field[i+1][j+1] =~ /\*/
	  			array[i][j] = "*"
	  		end
	  	end
	  end
	  print_array(array)


	  array2 = Array.new(n+2) { |i| Array.new(m+2) { |i| 0 }}
	  for i in 0...n
	  	for j in 0...m
	  		array2[i+1][j+1] = array[i][j] 
	  	end
	  end
	  print_array(array2)

	  for i in 1..n
	  	for j in 1..m
	  		if array2[i][j] == "*"
	  			array2[i-1][j] += 1 if array2[i-1][j] != "*"
	  			array2[i-1][j+1] += 1 if array2[i-1][j+1] != "*"
	  			array2[i-1][j-1] += 1 if array2[i-1][j-1] != "*"

	  			array2[i+1][j] += 1 if array2[i+1][j] != "*"
	  			array2[i+1][j+1] += 1 if array2[i+1][j+1] != "*"
	  			array2[i+1][j-1] += 1 if array2[i+1][j-1] != "*"

	  			array2[i][j+1] += 1 if array2[i][j+1] != "*"
	  			array2[i][j-1] += 1 if array2[i][j-1] != "*"
	  		end
	  	end
	  end

    print_array(array2)

	  for i in 1..n
	  	for j in 1..m
	  		if array2[i][j] == 0
	  			 array2[i][j] = " "
	  		end
	  	end
	  end

	  array2[0][0] = "+"
	  array2[n+1][m+1] = "+"
	  array2[0][m+1] = "+"
	  array2[n+1][0] = "+"

	  for j in 1..m
	  	array2[0][j] = "-" 
	  end

	  for j in 1..m
	  	array2[n+1][j] = "-" 
	  end

	  for i in 1..n
	  	array2[i][0] = "|"
	  end

	  for i in 1..n
	  	array2[i][m+1] = "|"
	  end
		
		print_array(array2)	

  end

end

inp1 = [
  '+-----+', 
  '| * * |', 
  '+-----+'
] 

inp2 = [
  '+------+', 
  '| *  * |', 
  '|  *   |', 
  '|    * |', 
  '|   * *|',
  '| *    |', 
  '|      |', 
  '+------+'
]

ms = Minesweeper.new(inp2)
ms.check
