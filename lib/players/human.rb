module Players
 class Human < Player
   def move(board)
     puts "Choose a position between 1-9:"
     input = gets.chomp
   end
 end
end
