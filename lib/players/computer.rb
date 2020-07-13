module Players
  class Computer < Player
    attr_reader :move
    def move(board)
      next_move = rand(1..9)
      next_move.to_s
    end
  end
end