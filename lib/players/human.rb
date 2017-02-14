require 'pry'
module Players
  class Human < Player
    attr_reader :move
    def move(board)
      puts "Enter a number between 1 and 9:"
      @move = gets.strip
      @move
    end
  end
end
