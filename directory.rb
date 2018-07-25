def input_students

  students = []
  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

  while true do
    puts "Please enter the name of the student or type quit to exit"
    name = gets.chomp
    break if name == 'quit'
    if !name.empty?
      puts "Please enter the cohort of the student"
      cohort = gets.chomp.downcase
    end

    if months.include?(cohort)
      students << { name: name, cohort: cohort.to_sym, hobbies: ["murder", "table tennis"], country_of_birth: :america, height: 178 }
      puts students.length > 1 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
    else
      puts "sorry i didnt understand...."
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end


def cohort_list(students)
  students.map { |student| student[:cohort] }.uniq
end



def print_students(students)

  puts "Filter for students whos names start with a specific letter?"
  puts "Select a letter to filter by or just hit return to skip"
  letter = gets .chomp

  puts "Filter for students by the length of their name?"
  puts "select a number of characters as the max length of the name or just return to print all names"
  max_chars = gets.chomp.to_i



  cohort_list(students).each do |cohort|
    x = 0
    while x < students.length
      result = "#{( x + 1 )}: #{students[x][:name]} (#{students[x][:cohort]} cohort)"
      if letter.empty? && max_chars == 0 && students[x][:cohort] == cohort
        puts result.center(50)
      elsif letter.empty? && max_chars != 0 && students[x][:cohort] == cohort
        puts result.center(50) if students[x][:name].size < (max_chars)
      elsif !letter.empty? && max_chars == 0 && students[x][:cohort] == cohort
        puts result.center(50) if students[x][:name].start_with?(letter)
      elsif students[x][:cohort] == cohort
        puts result.center(50) if students[x][:name].start_with?(letter) && students[x][:name].size < (max_chars - 1)
      end
    x += 1
    end
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
