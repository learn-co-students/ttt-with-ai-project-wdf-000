require 'spec_helper'

describe 'Players::Computer' do
  it 'inherits from Player' do
    expect(Players::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Players::Computer.new("X")
      board = Board.new
      Game.new(computer)

      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end
  end
end

    # def move(board)
      
    #   return rank(game) if self.game.over?
      

      
    #   binding.pry
    #   ranks = []
    #   possible_move.map do |move|
    #     dup_game.board.update(move, dup_game.current_player)
    #     binding.pry
    #     if dup_game.over?
          
    #     else
    #       binding.pry
    #       move
    #     end
    #   end
    #   binding.pry
    #   self.token=="X" ? ranks.each.with_index(1).max[1].to_s : ranks.each.with_index(1).min[1].to_s

    # end