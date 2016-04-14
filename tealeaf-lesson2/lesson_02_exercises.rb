#Mary Dean
#9/17/2014
#Lesson 2 Exercises

# THE OBJECT MODEL


puts "LESSON 2 EXERCISES"
puts "======================================"
puts "THE OBJECT MODEL"
puts "EXERCISES"
puts "======================================"

puts "Create a class that inherits from another"
module GiftWrapping
  #  container_type
  #  container_size
  #  decorative_paper
  #  gift_tag
  #  ribbon
end  

class Gift
  #  source
  #  cost
  #  shipping_weight
  #  thank_you_received?
  #  perishable?  
  include GiftWrapping
end
  
class BirthdayGift < Gift
  #   nth_birthday
end

class ChristmasGift < Gift
  #    religious_or_not
end
puts "\nGiftWrapping (module)"
p GiftWrapping.ancestors
puts "Hey that's interesting. Modules don't have ancestors!"
puts "\nGift"
p Gift.ancestors
puts "\nBirthdayGift"
p BirthdayGift.ancestors
puts "\nChristmasGift"
print ChristmasGift.ancestors
puts
puts
puts "======================================"
puts "CLASSES AND OBJECTS"
puts "EXERCISES"
puts "======================================"
puts "Build a new car - version 1"
puts "======================================="

# Oh, I see, on this first one they DON'T want us to 
# use attr_accessor
class MyCar

  def initialize(y, c, m) 
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def current_speed
    puts "You are currently going #{@current_speed} mph"
  end

  def speed_up(number)
    @current_speed += number
    puts "Speeding up by #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "Slowing down by #{number} mph"
  end

  def turn_off
    @current_speed = 0
    puts "Turning off the ignition"
  end

end # end of Class
work_car = MyCar.new('2005', 'red', 'Honda Element')
work_car.current_speed
work_car.speed_up(20)
work_car.current_speed
work_car.brake(15)
work_car.current_speed
work_car.turn_off
work_car.current_speed
puts
puts "======================================"
puts "Build a new car, version 2 - don't allow year to be changed"
puts "======================================="

class MyCar2

  attr_accessor :color, :model
  attr_reader :year

  def initialize(y, c, m) 
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def info
    "This lovely #{@model} was made in #{year} and is painted #{color}."
  end

  def change_info(y,c,m)
    #self.year = y #CAN'T DO THIS BECAUSE OF ATTR_READER
    self.color = c
    self.model = m
  end

  def year=(year) # this DOES work to change the year
    @year=year
  end

  def spray_paint(new_color)
     self.color = new_color    
  end

  def current_speed
    puts "You are currently going #{@current_speed} mph"
  end

  def speed_up(number)
    @current_speed += number
    puts "Speeding up by #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "Slowing down by #{number} mph"
  end

  def turn_off
    @current_speed = 0
    puts "Turning off the ignition"
  end

end # end of Class
puts "First I will create a new car:"
sporty_car = MyCar2.new('2014', 'blue', 'Audi Roadster')
puts sporty_car.info
puts
puts "Now I will try to change all three attributes using change_info:"
sporty_car.change_info('2002', 'pink', 'Ford pickup')
puts sporty_car.info
puts "As you can see, it didn't let me change the year!"
puts "It just ignored the 'year' argument."
puts
puts "Now I will change the year explicitly with year= method:"
sporty_car.year="1932"
puts sporty_car.info
puts
puts 'Now I will call my spray_paint method:'
sporty_car.spray_paint("Zebra Stripe")
puts sporty_car.info
puts

puts "======================================"
puts "Add gas mileage to car"
puts "======================================="

class MyCar3

  attr_accessor :color, :model
  attr_reader :year

  def initialize(y, c, m) 
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def self.gas_mileage(miles,gallons)
    puts "The gas mileage is #{miles/gallons} mpg."
  end

  def to_s
    "This lovely #{@model} was made in #{year} and is painted #{color}."
  end

  def change_info(y,c,m)
    #self.year = y #CAN'T DO THIS BECAUSE OF ATTR_READER
    self.color = c
    self.model = m
  end

  def year=(year) # this explicitly DOES work to change the year
    @year=year
  end

  def spray_paint(new_color)
     self.color = new_color    
  end

  def current_speed
    puts "You are currently going #{@current_speed} mph"
  end

  def speed_up(number)
    @current_speed += number
    puts "Speeding up by #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "Slowing down by #{number} mph"
  end

  def turn_off
    @current_speed = 0
    puts "Turning off the ignition"
  end
end
chevy = MyCar3.new("1956", "baby blue", "Edsel")
p chevy.to_s
MyCar3.gas_mileage(120000, 1000)
puts


puts "======================================"
puts "INHERITANCE"
puts "EXERCISES"
puts "======================================"
puts "MAKE A VEHICLE SUPERCLASS"
puts "With Car and Truck subclasses"
puts "Use a CONSTANT and a MODULE"
puts "======================================="

module DOT_requirements
  attr_accessor :interstate, :dot_number
  def requires_DOT_number
    @interstate = "no"
    @dot_number = "Because of weight DOT number not required"
  end
end
 

class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :make, :model, :color, :year
  def initialize(make, model, color, year) 
    @make = make
    @model = model
    @color = color
    @year = year
    @current_speed = 0
    @@number_of_vehicles += 1
   end

  def self.total_number_of_vehicles
    @@number_of_vehicles
  end

  def self.gas_mileage(miles,gallons)
    puts "The gas mileage is #{miles/gallons} mpg."
  end

  def to_s
    "This lovely #{make} #{@model} was made in #{@year} and is painted #{@color}."
    #removed: "It is #{age} years old."
  end

  def change_info(make, model, color, year)
    self.make = make
    self.model = model
    self.color = color
    self.year = year
  end

  def spray_paint(new_color)
     self.color = new_color    
  end

  def current_speed
    puts "You are currently going #{@current_speed} mph"
  end

  def speed_up(number)
    @current_speed += number
    puts "Speeding up by #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "Slowing down by #{number} mph"
  end

  def turn_off
    @current_speed = 0
    puts "Turning off the ignition"
  end

  private

  def age
    Time.now.year - year.to_i 
  end

end #end of class Vehicle

class Car < Vehicle
  @@number_of_cars = 0
  attr_accessor :num_doors, :style
  def initialize(make, model, color, year, num_doors, style) 
    super(make, model, color, year)
    @num_doors = num_doors
    @style = style
    @@number_of_cars += 1
  end
  def self.total_number_of_cars
    @@number_of_cars
  end  
  def spray_paint(new_color)
     super
     p self
     puts "I am going to add racing stripes, too"
  end
  def to_s
    super + "
    It is a #{num_doors} #{style}"
  end

end #end of class Car

class Truck < Vehicle
  @@number_of_trucks = 0
  include DOT_requirements
  attr_accessor :fuel_type, :weight
  MAX_LEGAL_WEIGHT = "60,000 pounds"
  def initialize(make, model, color, year, fuel_type, weight)
    super(make, model, color, year)
    @fuel_type = fuel_type
    @weight = weight
    @@number_of_trucks += 1
  end
  def to_s
    super + " It is powered by #{fuel_type} and weighs #{weight}" + "
       The max legal weight is #{MAX_LEGAL_WEIGHT}.
       The vehicle is #{age} years old. "
  end
  def self.total_number_of_trucks
    @@number_of_trucks
  end
end #end of class Truck


puts "Here is my module:"
p DOT_requirements.ancestors
puts
puts "Here is my Vehicle class"
p Vehicle.ancestors
puts "\nHere is my Car class"
p Car.ancestors
puts "\nHere is my Truck class"
p Truck.ancestors
puts
puts "Now I will create a vehicle:"
vehicle1 = Vehicle.new("Sherman", "Tank", "camouflage", "1945")
p vehicle1
puts
puts "Some cars:"
car1 = Car.new("Honda", "Civic", "Pink", "2009", "4-door", "hatchback")
p car1
car2 = Car.new("Audi", "TT", "Navy blue", "2014", "2-door", "roadster")
p car2
car3 = Car.new("Rolls Royce", "Deluxe", "gold", "2012", "6-door", "limo")
p car3
puts
puts "And a truck"
truck1 = Truck.new("Izuzu","Box truck","White", "2005", "diesel", "22,000 pounds")
p truck1
puts "\nHere I am using my class variables to keep track of vehicle production:"
puts "You have created a total of #{Car.total_number_of_cars} cars and #{Truck.total_number_of_trucks} trucks."
puts
puts "Now I am proving that my DOT_requirements module works inside of Truck:"
puts truck1.requires_DOT_number
puts "\nNow I will demonstrate my spray_paint method by changing some paint colors"
puts "The exciting thing is that I learned how to NOT override but ADD to the
superclass methods. I have added additional behaviors to to_s and spray_paint"
puts
truck1.spray_paint('PURPLE POLKA DOTS')
p truck1
puts
car2.spray_paint("NEON ORANGE")

puts 


puts "================================="
puts "STUDENT"
puts "================================="

class Student
  attr_accessor :name
  attr_reader :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  protected
  def grade
    @grade
  end
  
  public
  
  def better_grade_than?(name)
    if self.grade > name.grade
      puts "Yes, #{@name}, you got a better grade than #{name.name}!"
    else
      puts "Sorry, #{@name} but #{name.name} did better than you."
    end
  end
end
public
student1 = Student.new("John", 92)
student2 = Student.new("Meredith", 87)
puts "This method is public and has access to the actual grades"
puts "student1.better_grade_than?(student2)"
student1.better_grade_than?(student2)
student2.better_grade_than?(student1)
puts 
puts "Trying to access actual grade should give an error
because @grade getter is protected... and here it is"
puts
puts %Q{"\#\{student1.name\} received a score of \#\{student1.grade\}"}
puts
begin
  puts "#{student1.name} received a score of #{student1.grade}"
rescue => e
  puts e.message
end

puts "\nOh, boy! That can't be right! The error message includes the
student grade I was trying to protect!"
puts
puts "======================="
puts "EXTRA CREDIT"
puts "======================="
puts "These are methods that show stuff"
puts "------------------"
puts "puts local_variables:"
puts "------------------"
puts local_variables
puts "------------------"
puts "puts car2.local_variables"
puts "------------------"
puts "  # gives No method error"
#puts car2.local_variables
puts "------------------"
puts "puts car2.instance_variables:"
puts "------------------"
puts car2.instance_variables
puts "------------------"
puts "puts Vehicle.instance_methods"
puts "------------------"
puts "  # prints a HUGE list including the ones we made"
#puts Vehicle.instance_methods
puts "------------------"
puts "I want to show only MY methods"
puts "and I found out how!!!"
puts "puts Vehicle.instance_methods(false).sort"
puts "------------------"
puts Vehicle.instance_methods(false).sort 
puts "------------------"
puts "And here is one more. This gives you the class methods:"
puts "puts Vehicle.methods - Object.methods "
puts "------------------"
puts Vehicle.methods - Object.methods 





