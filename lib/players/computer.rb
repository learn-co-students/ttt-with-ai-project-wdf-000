module Players
  class Computer < Player
    attr_accessor :valid_moves
    def initialize(token)
      @token = token
    end

    def move(board)
      rand(1..9).to_s  
    end
  end
end