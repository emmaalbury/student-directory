@students = [] # an empty array accessible to all methods

def print_menu
# 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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

def add_students
  @students << {name: @name == "" ? "#info missing" : @name, cohort: @cohort, hobby: @hobby == "" ? "#info missing" : @hobby, birth: @birth_place == "" ? "#info missing" : @birth_place}
end

def input_students
  puts "Please enter the name of a student"
  puts "To finish, just hit return twice"
  # create an empty array
  # students = []
  # gets name
  @name = STDIN.gets.strip
  # empty array used to print students by cohort
  cohorts = {}
  # while the name is not empty, repeat this code
  while !@name.empty? do
    puts "What is their cohort?"
    @cohort = STDIN.gets.strip
    # add cohorts to cohort array
    cohort = cohort == "" ? "#info missing" : @cohort
    if cohorts[cohort]
      cohorts[cohort].push(name)
    else
      cohorts[cohort] = [@name]
    end
    # ask for other info
    puts "What is their favorite hobby?"
    @hobby = STDIN.gets.strip
    puts "Where were they born?"
    @birth_place = STDIN.gets.strip
    # add the student hash to the array
    add_students
    # give running count
    if @students.length > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    # allow user to fix typos in last entry
    puts "If you have made a typo, enter 'typo', else hit return."
    @typo = STDIN.gets.strip
    if @typo == "typo"
      puts "what would you like to replace?"
      delete = STDIN.gets.strip
      puts "what would you like to replace it with?"
      replacement = STDIN.gets.strip
      @students[-1].each do |key, value|
        if value == delete
          @students[-1][key] = replacement
        end
      end
    end
    # get another name from the user
    puts "Please enter the name of a student"
    puts "To finish, just hit return twice"
    @name = STDIN.gets.strip
  end
  return cohorts, @students
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "_____________".center(80)
  puts " "
end

#def print(cohorts)
# prints students according to cohort
#  cohorts.each do |key, value|
#    puts value
#  end
#prints students in order of user entry
#  students.each_with_index do |student, index|
#    if student[:name].start_with?("M") && student[:name].length < 12
#      puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort, born in #{student[:birth]} and enjoys #{student[:hobby]})".center(80)
#    end
#  end
# end

def print_students_list()
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

#def print_footer(students)
# prints out final count
#  puts " "
#  puts "Overall, we have #{students.count} great students".center(80)
#  puts " "
#end

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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command cvs_line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
# print_header
# print_students_list()
# print_footer

# cohorts, students = input_students
# print_header
# print(cohorts)
# print_footer(students)
