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
        if flags.empty?
          # without flags
          found << line.chomp if line.include? word
        elsif flags.size == 1
          # with flag -n
          found << "#{file}: #{index + 1}: #{line}" if flag_n?(line)
          # with flag -l
          found << file if flag_l?(line)
          # with flag -i
          found << line.chomp if flag_i?(line)
          # with flag -x
          found << line.chomp if flag_x?(line)
          # with flag -v
          found << line.chomp if flag_v?(line)
        elsif flags.size == 2
          # with flags -n -i
          found << "#{file}: #{index + 1}: #{line}" if flag_n_i?(line)
          # with flags -n -v
          found << "#{file}: #{index + 1}: #{line}" if flag_n_v?(line)
          # with flags -n -x
          found << "#{file}: #{index + 1}: #{line}" if flag_n_x?(line)
          # with flags -l -v
          found << file if flag_l_v?(file, word)
          # with flags -i -x
          found << line.chomp if flag_i_x?(line)
        elsif flags.size == 3
          # with flags -n -i -x
          found << "#{file}: #{index + 1}: #{line}" if flag_n_i_x?(line)
        end
      end
    end
    check(found)
  end

  private

  def flag_n_i_x?(line)
    flag_i_x?(line) if flags.include?('-n') && flags.include?('-i') && flags.include?('-x')
  end

  def flag_i_x?(line)
    if flags.include?('-i') && flags.include?('-x')
      if line.downcase.include? word.downcase
        line if line.strip.chomp == word
      end
    end
  end

  def flag_l_v?(file, word)
    if flags.include?('-l') && flags.include?('-v')
      file unless File.readlines(file).any? { |l| l[word] }
    end
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
    line.include? word if flags.include?('')
  end

  def flag_n?(line)
    line.include? word if flags.include?('-n')
  end

  def flag_l?(line)
    files.size > 1 if flags.include?('-l') && line.include?(word)
  end

  def flag_i?(line)
    line.downcase.include? word.downcase if flags.include?('-i')
  end

  def flag_x?(line)
    line.strip.chomp == word if flags.include?('-x')
  end

  def flag_v?(line)
    if flags.include?('-v')
      line unless line.include? word
    end
  end
end

hi = Grep.new('hello', ['-n', '-i'], ['input.txt', 'input2.txt'])

puts hi.grep
