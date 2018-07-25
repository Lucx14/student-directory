def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << { name: name, cohort: :november, hobbies: ["murder", "table tennis"], country_of_birth: :america, height: 178 }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students(students)

  puts "Filter for students whos names start with a specific letter?"
  puts "Select a letter to filter by or just hit retrun to print all names"
  letter = gets .chomp

  puts "Filter for students by the length of their name?"
  puts "select a number of characters as the max length of the name or just return to print all names"
  max_chars = gets.chomp.to_i


  x = 0
  while x < students.length
    result = "#{( x + 1 )}: #{students[x][:name]} (#{students[x][:cohort]} cohort)"
    if letter.empty? && max_chars == 0
      puts result.center(50)
    elsif letter.empty? && max_chars != 0
      puts result.center(50) if students[x][:name].size < (max_chars)
    elsif !letter.empty? && max_chars == 0
      puts result.center(50) if students[x][:name].start_with?(letter)
    else
      puts result.center(50) if students[x][:name].start_with?(letter) && students[x][:name].size < (max_chars - 1)
    end
  x += 1
  end
end



def print_footer(names)
  puts "Overall we have #{names.count} great students".center(50)
end


students = input_students
print_header
print_students(students)
print_footer(students)



=begin
puts "The students of Villains Academy"
puts "-------------"
puts "Dr. Hannibal Lecter"
puts "Darth Vader"
puts "Nurse Ratched"
puts "Michael Corleone"
puts "Alex DeLarge"
puts "The Wicked Witch of the West"
puts "Terminator"
puts "Freddy Krueger"
puts "The Joker"
puts "Joffrey Baratheon"
puts "Norman Bates"
=end
