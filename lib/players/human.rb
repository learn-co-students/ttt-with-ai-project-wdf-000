module Players
  class Human < Player
    def move(board)
      puts "What move would you like to make?"
      new_move = gets
      new_move.to_s
    end
  end
end
