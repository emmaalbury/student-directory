@students = [] # an empty array accessible to all methods

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    cvs_line = student_data.join(",")
    file.puts cvs_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
    @students << {:name => name, :cohort => :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Please enter the name of another student"
    puts "To finish, just hit return twice"
    name = gets.chomp
  end
  # return the array of students
  @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
# 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end
# 2. read the input and save it into a variable
# selection = gets.chomp

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
    # 3. do what the user has asked
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list()
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

@students = interactive_menu
print_header
print_students_list()
print_footer
