require 'pry'
module Players
  class Computer < Player
    attr_accessor :win_combinations, :board

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def initialize(token)
      @token = token
      @win_combinations = WIN_COMBINATIONS
    end

    def move(board)
      @board = board
      def play_or_nil(input)
        !board.taken?(input) ? input : nil
      end

      def op_pos_count(combo)
        combo.select do |position|
          board.cells[position] != " " && board.cells[position] != @token
        end.size
      end

      def best_op_combo
        win_combos = @win_combinations.delete_if do |combo|
          combo.any? {|position| board.cells[position] == @token} # || board.cells[position] != " "
        end
        win_combos.sort_by {|combo| op_pos_count(combo)}.last
      end

      def pick_move
        best_op_combo ? best_op_combo.sample || [0,2,6,8].detect{|p|play_or_nil(p)} : rand(1..9) # play_or_nil([0,2,6,8].sample) || 
      end


      # board = board ? board : board
      # binding.pry
      play_or_nil("5") || (pick_move + 1).to_s || ["1","3","7","9"].detect{|p| play_or_nil(p)} || rand(1..9).to_s
    end

  end
end