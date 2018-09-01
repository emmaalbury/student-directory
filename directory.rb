def print_header
  puts "The students of Villains Academy".center(80)
  puts "_____________".center(80)
  puts " "
end
def print(students)
  students.each_with_index do |student, index|
    if student[:name].start_with?("M") && student[:name].length < 12
      puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort, born in #{student[:birth]} and enjoys #{student[:hobby]})".center(80)
    end
  end
end
def print_footer(students)
  puts " "
  puts "Overall, we have #{students.count} great students".center(80)
  puts " "
end

def input_students
  puts "Please enter the name of a student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first chomp
  name = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is their cohort?"
    cohort = gets.strip
    puts "What is their favorite hobby?"
    hobby = gets.strip
    puts "Where were they born?"
    birth_place = gets.strip
    # add the student hash to the array
    students << {name: name == "" ? "#info missing" : name, cohort: cohort == "" ? "#info missing" : cohort, hobby: hobby == "" ? "#info missing" : hobby, birth: birth_place == "" ? "#info missing" : birth_place}
    if students.length > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    # get another name from the user
    puts "Please enter the name of a student"
    puts "To finish, just hit return twice"
    name = gets.strip
  end
  # return the array of input_students
  students
end

students = input_students
print_header
print(students)
print_footer(students)
