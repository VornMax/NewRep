# frozen_string_literal: true

# Class Minesweeper.
class Minesweeper
  attr_reader :field

  def initialize(field)
    @field = field
    @n = field.length - 2
    @m = field[0].length - 2
  end

  def check
    array = Array.new(@n) { |_i| Array.new(@m) { |_i| 0 } }

    add_mine(array)

    array2 = Array.new(@n + 2) { |_i| Array.new(@m + 2) { |_i| 0 } }

    create_field(array, array2)

    add_point(array2)

    change_zero(array2)

    add_border(array2)

    print_array(array2)
  end

  private

  def add_mine(array)
    (0...@n).each do |i|
      (0...@m).each do |j|
        array[i][j] = '*' if field[i + 1][j + 1] =~ /\*/
      end
    end
  end

  def create_field(array, array2)
    (0...@n).each do |i|
      (0...@m).each do |j|
        array2[i + 1][j + 1] = array[i][j]
      end
    end
  end

  def add_point(array2)
    (1..@n).each do |row|
      (1..@m).each do |line|
        next unless array2[row][line] == '*'

        high_level_add(row, line, array2)

        low_level_add(row, line, array2)

        row_add(row, line, array2)

        medium_level_add(row, line, array2)
      end
    end
  end

  def change_zero(array2)
    (1..@n).each do |i|
      (1..@m).each do |j|
        array2[i][j] = ' ' if array2[i][j].to_s =~ /0/
      end
    end
  end

  def add_border(array2)
    add_plus(array2)

    add_minus(array2)

    vertical_slash(array2)
  end

  def add_plus(array2)
    array2[0][0] = '+'
    array2[@n + 1][@m + 1] = '+'
    array2[0][@m + 1] = '+'
    array2[@n + 1][0] = '+'
  end

  def add_minus(array2)
    (1..@m).each do |j|
      array2[0][j] = '-'
      array2[@n + 1][j] = '-'
    end
  end

  def vertical_slash(array2)
    (1..@n).each do |i|
      array2[i][0] = '|'
      array2[i][@m + 1] = '|'
    end
  end

  def high_level_add(row, line, array2)
    array2[row - 1][line + 1] += 1 if array2[row - 1][line + 1] != '*'
    array2[row - 1][line - 1] += 1 if array2[row - 1][line - 1] != '*'
  end

  def low_level_add(row, line, array2)
    array2[row + 1][line + 1] += 1 if array2[row + 1][line + 1] != '*'
    array2[row + 1][line - 1] += 1 if array2[row + 1][line - 1] != '*'
  end

  def row_add(row, line, array2)
    array2[row - 1][line] += 1 if array2[row - 1][line] != '*'
    array2[row + 1][line] += 1 if array2[row + 1][line] != '*'
  end

  def medium_level_add(row, line, array2)
    array2[row][line + 1] += 1 if array2[row][line + 1] != '*'
    array2[row][line - 1] += 1 if array2[row][line - 1] != '*'
  end

  def print_array(array)
    array.each do |line|
      line.each do |elem|
        print elem
      end
      print "\n"
    end
    puts ''
  end
end

inp1 = [
  '+------+',
  '| *  * |',
  '|  *   |',
  '|    * |',
  '|   * *|',
  '| *  * |',
  '|      |',
  '+------+'
]

ms1 = Minesweeper.new(inp1)
ms1.check
