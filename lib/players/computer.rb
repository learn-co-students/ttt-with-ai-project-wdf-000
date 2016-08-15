module Players
  class Computer < Player
    def move(board)
      new_move = rand(1..9)
      new_move.to_s
    end
  end
end
