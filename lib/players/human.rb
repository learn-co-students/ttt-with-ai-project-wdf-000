require 'colorize'
module Players

  class Human < Player

    def move(board)
      if(self.token == "X")
        puts "Please enter a number from 1 - 9: ".colorize(:red)
        puts "----------------------------------".colorize(:red)
      else
        puts "Please enter a number from 1 - 9: ".colorize(:light_green)
        puts "----------------------------------".colorize(:light_green)
      end
      
      input = gets.strip
      input
    end

  end

end
