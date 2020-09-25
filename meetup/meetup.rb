require 'date'

class Meetup

  def initialize(month, year)
    @month = month
    @year =	year
  end

  def day(weekday, schedule)
    range = case schedule
      when :first
        1..7
      when :second
        8..14
      when :third
        15..21
      when :fourth
        22..28
      when :last
        days = Date.new(@year, @month, -1).day
        (days - 6)..days
      when :teenth
        13..19
    end
    range.map { |e| Date.new(@year, @month, e) }.find { |e| e.send(:"#{weekday}?") }
  end

end

d = Meetup.new(1, 2017).day(:monday, :second)
d2 = Meetup.new(1, 2017).day(:tuesday, :third)  
d3 = Meetup.new(1, 2017).day(:wednesday, :teenth) 
d4 = Meetup.new(1, 2017).day(:thursday, :last) 
puts d
puts d2
puts d3
puts d4


