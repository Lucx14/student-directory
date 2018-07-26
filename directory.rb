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

    if months.include?(cohort) && !name.empty?
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


  if students.length != 0
    puts "Filter for students whos names start with a specific letter?"
    puts "Select a letter to filter by or just hit return to skip"
    letter = gets.delete_suffix("\n") #HAVE REPLACED CHOMP HERE WITH Delete_suffix("\n")

    puts "Filter for students by the length of their name?"
    puts "select a number of characters as the max length of the name or just return to print all names"
    max_chars = gets.chomp.to_i

    print_header #Calling the header here , it looks a bit better in the terminal

    x = 0
    cohort_list(students).each do |cohort|
      students.each_with_index do |student, i|
        result = "#{( x + 1 )}: #{students[i][:name]} (#{students[i][:cohort]} cohort)"
        if letter.empty? && max_chars == 0 && students[i][:cohort] == cohort
          puts result.center(50)
          x += 1
        elsif letter.empty? && max_chars != 0 && students[i][:cohort] == cohort
          puts result.center(50) if students[i][:name].size < (max_chars)
          x += 1
        elsif !letter.empty? && max_chars == 0 && students[i][:cohort] == cohort
          puts result.center(50) if students[i][:name].start_with?(letter)
          x += 1
        elsif students[i][:cohort] == cohort
          puts result.center(50) if students[i][:name].start_with?(letter) && students[i][:name].size < (max_chars - 1)
          x += 1
        end
      end
    end
  end

end




def print_footer(names)
  puts
  puts "Overall we have #{names.count} great students".center(50)
  puts
end


students = input_students
#print_header
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
