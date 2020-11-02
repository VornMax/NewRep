# frozen_string_literal: true

# Class for search words in files.
class Grep
  attr_reader :word, :flags, :files

  def initialize(word, flags, files)
    @word = word
    @flags = flags
    @files = files
  end

  def grep
    found = []
    files.each do |file|
      File.readlines(file).each_with_index do |line, index|
        how_flags(index, line, found, file)
      end
    end
    check(found)
  end

  private

  def how_flags(index, line, found, file)
    if flags.empty?
      no_flag(line, found)
    elsif flags.size == 1
      one_flag(index, line, found, file)
    elsif flags.size == 2
      two_flags(index, line, found, file)
    elsif flags.size == 3
      three_flags(index, line, found, file)
    end
  end

  def no_flag(line, found)
    found << line.chomp if line.include? word
  end

  def one_flag(index, line, found, file)
    found << "#{file}: #{index + 1}: #{line}" if flag_n?(line)
    found << file if flag_l?(line)
    return unless flag_i?(line) || flag_x?(line) || flag_v?(line)

    found << line.chomp
  end

  def two_flags(index, line, found, file)
    found << file if flag_l_v?(file, word)
    found << line.chomp if flag_i_x?(line)
    return unless flag_n_i?(line) || flag_n_v?(line) || flag_n_x?(line)

    found << "#{file}: #{index + 1}: #{line}"
  end

  def three_flags(index, line, found, file)
    found << "#{file}: #{index + 1}: #{line}" if flag_n_i_x?(line)
  end

  def flag_n_i_x?(line)
    flag_i_x?(line) if flags.include?('-n') && flags.include?('-i') && flags.include?('-x')
  end

  def flag_i_x?(line)
    return unless flags.include?('-i') && flags.include?('-x')

    return unless line.downcase.include? word.downcase

    line if x_flag(line)
  end

  def flag_l_v?(file, word)
    return unless flags.include?('-l') && flags.include?('-v')

    file unless File.readlines(file).any? { |l| l[word] }
  end

  def flag_n_x?(line)
    flag_x?(line) if flags.include?('-n') && flags.include?('-x')
  end

  def flag_n_v?(line)
    flag_v?(line) if flags.include?('-n') && flags.include?('-v')
  end

  def flag_n_i?(line)
    flag_i?(line) if flags.include?('-n') && flags.include?('-i')
  end

  def check(found)
    if flags.include?('-l')
      found.uniq
    else
      found
    end
  end

  def no_flag?(line)
    match_line(line) if flags.include?('')
  end

  def flag_n?(line)
    match_line(line) if flags.include?('-n')
  end

  def flag_l?(line)
    files.size > 1 if flags.include?('-l') && line.include?(word)
  end

  def flag_i?(line)
    i_flag(line) if flags.include?('-i')
  end

  def flag_x?(line)
    x_flag(line) if flags.include?('-x')
  end

  def flag_v?(line)
    return unless flags.include?('-v')

    v_flag(line)
  end

  def match_line(line)
    line.include? word
  end

  def i_flag(line)
    line.downcase.include? word.downcase
  end

  def x_flag(line)
    line.strip.chomp == word
  end

  def v_flag(line)
    line unless line.include? word
  end
end

hi = Grep.new('hello', ['-l'], ['input.txt', 'input2.txt'])

puts hi.grep
