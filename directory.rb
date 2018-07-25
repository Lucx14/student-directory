
#Lets puts all the students into an array
students = ["Dr. Hannibal Lecter", "Darth Vader", "Nurse Ratched", "Michael Corleone", "Alex DeLarge", "The Wicked Witch of the West", "Terminator", "Freddie Krueger", "The Joker", "Joffrey Baratheon", "Norman Bates"]

# Define some methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_names(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

# call your methods
print_header
print_names(students)
print_footer(students)
