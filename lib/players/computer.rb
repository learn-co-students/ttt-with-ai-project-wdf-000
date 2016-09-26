module Players
  class Computer < Player
    attr_reader :move

    def move(board)
      ai_move = rand(1..9)
      ai_move.to_s
    end
  end
end
