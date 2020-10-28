# frozen_string_literal: true

# Class Minesweeper.
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
    puts ''
  end

  public

  def check
    n = field.length - 2
    m = field[0].length - 2
    array = Array.new(n) { |_i| Array.new(m) { |_i| 0 } }
    print_array(array)

    (0...n).each do |i|
      (0...m).each do |j|
        array[i][j] = '*' if field[i + 1][j + 1] =~ /\*/
      end
    end
    print_array(array)

    array2 = Array.new(n + 2) { |_i| Array.new(m + 2) { |_i| 0 } }
    (0...n).each do |i|
      (0...m).each do |j|
        array2[i + 1][j + 1] = array[i][j]
      end
    end
    print_array(array2)

    (1..n).each do |i|
      (1..m).each do |j|
        next unless array2[i][j] == '*'

        array2[i - 1][j] += 1 if array2[i - 1][j] != '*'
        array2[i - 1][j + 1] += 1 if array2[i - 1][j + 1] != '*'
        array2[i - 1][j - 1] += 1 if array2[i - 1][j - 1] != '*'

        array2[i + 1][j] += 1 if array2[i + 1][j] != '*'
        array2[i + 1][j + 1] += 1 if array2[i + 1][j + 1] != '*'
        array2[i + 1][j - 1] += 1 if array2[i + 1][j - 1] != '*'

        array2[i][j + 1] += 1 if array2[i][j + 1] != '*'
        array2[i][j - 1] += 1 if array2[i][j - 1] != '*'
      end
    end

    print_array(array2)

    (1..n).each do |i|
      (1..m).each do |j|
        array2[i][j] = ' ' if (array2[i][j]).zero?
      end
    end

    array2[0][0] = '+'
    array2[n + 1][m + 1] = '+'
    array2[0][m + 1] = '+'
    array2[n + 1][0] = '+'

    (1..m).each do |j|
      array2[0][j] = '-'
    end

    (1..m).each do |j|
      array2[n + 1][j] = '-'
    end

    (1..n).each do |i|
      array2[i][0] = '|'
    end

    (1..n).each do |i|
      array2[i][m + 1] = '|'
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

ms = Minesweeper.new(inp1)
ms.check
ms1 = Minesweeper.new(inp2)
ms1.check
