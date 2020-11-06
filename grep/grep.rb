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
        output(found, line, index, file) if match?(line)
      end
    end
    check_uniq(found)
  end

  private

  def output(found, line, index, file)
    out = line.chop
    out = "#{index + 1}: " + out if line_number?
    out = "#{file}:" + out if files.size > 1
    out = file if file_name?
    found << out
  end

  def match?(line)
    if invert?
      line !~ other_checks
    else
      line =~ other_checks
    end
  end

  def other_checks
    if without_register?
      /#{check_word}/i
    else
      /#{check_word}/
    end
  end

  def check_word
    if entire_line?
      "^#{word}$"
    else
      word
    end
  end

  def line_number?
    flags.include?('-n')
  end

  def file_name?
    flags.include?('-l')
  end

  def without_register?
    flags.include?('-i')
  end

  def entire_line?
    flags.include?('-x')
  end

  def invert?
    flags.include?('-v')
  end

  def check_uniq(found)
    if file_name?
      found.uniq
    else
      found
    end
  end
end

hi = Grep.new('hello', ['-v'], ['input.txt', 'input2.txt'])
puts hi.grep
