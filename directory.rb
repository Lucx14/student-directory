student_count = 11
#Lets puts all the students into an array
students = ["Dr. Hannibal Lecter", "Darth Vader", "Nurse Ratched", "Michael Corleone", "Alex DeLarge", "The Wicked Witch of the West", "Terminator", "Freddie Krueger", "The Joker", "Joffrey Baratheon", "Norman Bates"]
# and then we can print the using a .each array loop
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# Finally we print the total number of students
puts "Overall we have #{students.count} great students"
