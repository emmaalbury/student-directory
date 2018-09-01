def print_header
  puts "The students of Villains Academy".center(80)
  puts "_____________".center(80)
  puts " "
end
def print(cohorts)
# prints students according to cohort
  cohorts.each do |key, value|
    puts value
  end
#prints students in order of user entry
#  students.each_with_index do |student, index|
#    if student[:name].start_with?("M") && student[:name].length < 12
#      puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort, born in #{student[:birth]} and enjoys #{student[:hobby]})".center(80)
#    end
#  end
end
def print_footer(students)
# prints out final count
  puts " "
  puts "Overall, we have #{students.count} great students".center(80)
  puts " "
end

def input_students
  puts "Please enter the name of a student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # gets name
  name = gets.strip
  # empty array used to print students by cohort
  cohorts = {}
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is their cohort?"
    cohort = gets.strip
    # add cohorts to cohort array
    cohort = cohort == "" ? "#info missing" : cohort
    if cohorts[cohort]
      cohorts[cohort].push(name)
    else
      cohorts[cohort] = [name]
    end
    # ask for other info
    puts "What is their favorite hobby?"
    hobby = gets.strip
    puts "Where were they born?"
    birth_place = gets.strip
    # add the student hash to the array
    students << {name: name == "" ? "#info missing" : name, cohort: cohort, hobby: hobby == "" ? "#info missing" : hobby, birth: birth_place == "" ? "#info missing" : birth_place}
    # give running count
    if students.length > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    # allow user to fix typos in last entry
    puts "If you have made a typo, enter 'typo', else hit return."
    typo = gets.strip
    if typo == "typo"
      puts "what would you like to replace?"
      delete = gets.strip
      puts "what would you like to replace it with?"
      replacement = gets.strip
      students[-1].each do |key, value|
        if value == delete
          students[-1][key] = replacement
        end
      end
    end
    # get another name from the user
    puts "Please enter the name of a student"
    puts "To finish, just hit return twice"
    name = gets.strip
  end
  return cohorts, students
end

cohorts, students = input_students
print_header
print(cohorts)
print_footer(students)
