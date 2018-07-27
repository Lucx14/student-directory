@students = [] #An empty array accessible to all methods
@months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

def get_name
  puts "Please enter the name of the student or type quit to exit"
  STDIN.gets.chomp
end

def get_cohort
  puts "Please enter the cohort of the student"
  STDIN.gets.chomp.downcase
end


def input_students
  while true do
    name = get_name
    break if name == 'quit'
    if !name.empty?
      cohort = get_cohort
    end
    if @months.include?(cohort) && !name.empty?
      add_students(name, cohort)
      puts "#{name} was added to the list"
      puts @students.length > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
    else
      puts "sorry i didnt understand...."
    end
  end
end

def add_students(name, cohort)
  @students << { name: name, cohort: cohort.to_sym }
end


def max_width_names
  columns = @students.map { |details| details.values }.transpose
  widths = columns.map do |column|
    column.max_by { |word| word.length}.length
  end
  widths[0]
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end


def cohort_list
  @students.map { |student| student[:cohort] }.uniq
end


def letter_filter
  puts "Filter for students whos names start with a specific letter?"
  puts "Select a letter to filter by or just hit return to skip"
  STDIN.gets.delete_suffix("\n") #HAVE REPLACED CHOMP HERE WITH Delete_suffix("\n")
end

def name_length_filter
  puts "Filter for students by the length of their name?"
  puts "select a number of characters as the max length of the name or just return to print all names"
  STDIN.gets.chomp.to_i
end


def students_generator
  letter = letter_filter
  max_chars = name_length_filter
  print_header #Calling the header here , it looks a bit better in the terminal

  x = 0
  cohort_list.each do |cohort|
    @students.each_with_index do |student, i|
      result = "#{( x + 1 )}: #{@students[i][:name]}#{' '*((max_width_names + 5) - (@students[i][:name]).length)}(#{@students[i][:cohort]} cohort)"
      if letter.empty? && max_chars == 0 && @students[i][:cohort] == cohort
        puts result
        x += 1
      elsif letter.empty? && max_chars != 0 && @students[i][:cohort] == cohort
        puts result if @students[i][:name].size < (max_chars)
        x += 1
      elsif !letter.empty? && max_chars == 0 && @students[i][:cohort] == cohort
        puts result if @students[i][:name].start_with?(letter)
        x += 1
      elsif @students[i][:cohort] == cohort
        puts result if @students[i][:name].start_with?(letter) && @students[i][:name].size < (max_chars - 1)
        x += 1
      end
    end
  end
end

def print_students
  @students.length != 0 ? students_generator : print_header
end


def print_footer
  puts
  puts "Overall we have #{@students.count} great students".center(50)
  puts
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end


def show_students
  print_students
  print_footer
end


def process(selection)
  case selection
    when "1" then students = input_students
    when "2" then show_students
    when "3" then save_students(choose_file)
    when "4" then load_students(choose_file)
    when "9" then exit #THIS WILL CAUSE THE PROGRAM TO TERMINATE
  else
    puts "I don't know what you mean, try again"
  end
end

def choose_file
  puts "Please choose a file"
  STDIN.gets.chomp
end

def file_error
  puts "sorry that file does not exist, please try again"
end



def save_students(filename)
  if File.exist?(filename) # IF IT EXISTS
    # Open the file for writing
    File.open(filename, "w") do |file| # reformatted file open and close into a do end block same below
      # iterate over the array of students
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
      end
    end
    puts "Student(s) details saved"
  else
    file_error
  end
end



def load_students(filename = "students.csv")
  if File.exist?(filename) # IF IT EXISTS
    File.open(filename, "r") do |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_students(name, cohort)
      end
    end
    puts "Student(s) details loaded"
  else
    file_error
  end
end



def try_load_students

  filename = ARGV.first # FIRST ARGUMENT FROM THE COMMAND LINE
  if filename.nil? # Get out the method if it isnt given
    load_students
    return
  end
  if File.exist?(filename) # If it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end



def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


try_load_students
interactive_menu


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
