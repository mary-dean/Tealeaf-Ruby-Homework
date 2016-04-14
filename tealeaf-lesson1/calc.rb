
intro = <<END_MARKER


  .oooooo.         .o.       ooooo          .oooooo.   
 d8P'  `Y8b       .888.      `888'         d8P'  `Y8b  
888              .8"888.      888         888          
888             .8' `888.     888         888          
888            .88ooo8888.    888         888          
`88b    ooo   .8'     `888.   888       o `88b    ooo  
 `Y8bood8P'  o88o     o8888o o888ooooood8  `Y8bood8P'  
                                                       

END_MARKER
puts intro
puts "- - - - Welcome to Mary's Amazing Calculator - - - -"
puts "\nPlease enter a number, then press enter:"
x = gets.chomp.to_f
puts "\nNow enter a second number:"
y = gets.chomp.to_f
puts "\nWhat would you like to do with #{x} and #{y}?"
puts "1. Add          4. Division     7. Gamma
2. Subtract     5. Hypotenuse   8. Inverse hyperbolic tangent
3. Multiply     6. Log, base    9. Factorial"
puts "\n"
z = gets.chomp[0].to_i

choice = case z
  when 1 then "add"
  when 2 then "subtract"
  when 3 then "multiply"
  when 4 then "divide"
  when 5 then "calculate the hypotenuse"
  when 6 then "log"
  when 7 then "do whatever gamma does"
  when 8 then "inverse hyperbolic tangent"
  when 9 then "calculate the factorial"
  else "\n...That is not a valid choice for "
  end

puts "\nYou have chosen to #{choice} #{x} and #{y}"
print "\nDrum roll, please. . ."
show_text = "pah RUM pum pum PUM"
c = 0
show_text.length.times do
  print show_text[c]
  c += 1
  sleep 0.15
end

begin  #start of error handling
answer = case z
  when 1 then x + y
  when 2 then x - y
  when 3 then x * y
  when 4 then x / y
  when 5 then Math.hypot(x,y)
  when 6 then log(x,y)
  when 7 then [Math.gamma(x), Math.gamma(y)]
  when 8 then [Math.atanh(x), Math.atanh(y)]
  when 9 then [(1..x).inject(1, :*), (1..y).inject(1, :*)]
  else 0
  end
rescue 
  puts "\n\n        I'm sorry, but your answer lies beyond the 
      frontiers of current mathematical understanding"
  exit
end  #end of error handling

puts "\n\n            Ladies and gentlemen, the answer is 
                ===>    #{answer}    <==="
                               
puts "\n\n\n"
