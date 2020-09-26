require 'date'

string = "The first Monday of January 2017"

array_string = string.split(' ')


date_time = Date.parse(string)
month = date_time.mon
year = date_time.year


day_of_month = array_string[1]
range = 0

if day_of_month == "first"
      range = (1..7)
elsif day_of_month == "second"   
      range = (8..14) 
elsif day_of_month == "third"
      range = (15..21)
elsif day_of_month == "fourth"
      range = (22..28)
else day_of_month == "teenth"
      range = (13..19)
end

day_of_week = array_string[2]

day = range.find do |day|
       Date.new(year, month, day).method("#{day_of_week.downcase}?").call
end

puts "#{year}/#{month}/#{day}" 