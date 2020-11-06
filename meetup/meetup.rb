# frozen_string_literal: true

require 'date'

string = 'The first Monday of January 2017'

array_string = string.split(' ')

date_time = Date.parse(string)
month = date_time.mon
year = date_time.year

day_of_month = array_string[1]
range = 0

case day_of_month
when 'first' then range = (1..7)
when 'second' then range = (8..14)
when 'third' then range = (15..21)
when 'fourth' then range = (22..28)
when 'teenth' then range = (13..19)
end

day_of_week = array_string[2]

day1 = range.find do |day|
  Date.new(year, month, day).method("#{day_of_week.downcase}?").call
end

puts "#{year}/#{month}/#{day1}"
