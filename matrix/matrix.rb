# frozen_string_literal: true

def print_matrix(field)
  field.each do |line|
    line.each do |elem|
      print elem + ' '
    end
    print "\n"
  end
end

field1 = [%w[9 3 4],
          %w[8 5 7],
          %w[6 1 0]]

puts 'First matrix:'
print_matrix(field1)

field2 = field1.transpose

puts 'Second matrix:'
print_matrix(field2)
