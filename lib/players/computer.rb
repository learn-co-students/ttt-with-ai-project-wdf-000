require "pry"
module Players
  class Computer < Player
    attr_accessor :valid_moves
    def initialize(token)
      @token = token
      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end

    def move(board)
      # board.cells.each_with_index do |cell,index|
      # @valid_moves.delete(index+1) if cell == "X" || cell == "O"
      # end
      # while board.valid_move?(@valid_moves.sample.to_i + 1)
      #   move = @valid_moves.sample
      # end
      #   move
      rand(1..9).to_s
    end
  end
end