field = [['9','3','4'], 
		 ['8','5','7'], 
		 ['6','1','0']]

puts "First matrix:"
field.each do |line|
			line.each do |elem|
				print elem + ' '
			end
			print "\n"
end

field1 = field.transpose
#field1 = [[field[0][0], field[1][0], field[2][0]],
#          [field[0][1], field[1][1], field[2][1]],
#          [field[0][2], field[1][2], field[2][2]]]

puts "Second matrix:"
field1.each do |line|
			line.each do |elem|
				print elem + ' '
			end
			print "\n"
end


	



