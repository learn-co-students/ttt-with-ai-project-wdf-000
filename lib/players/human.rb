module Players
  class Human < Player

    def move(board)
      puts "Please make a move by enter 1 - 9:"
      gets.chomp
    end
  end
end
