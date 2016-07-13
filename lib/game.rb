
class Game
  include Players

  attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O") , board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count.even? ? player_1 : player_2
    end

    def wins_x?
      x_wins = nil
      WIN_COMBINATIONS.any? do |combination|
        x_wins = combination.all? { |x| board.cells[x] == "X"}
      end
      x_wins
    end

    def wins_o?
      o_wins = nil
      WIN_COMBINATIONS.any? do |combination|
        o_wins = combination.all? { |x| board.cells[x] == "O"}
      end
      o_wins
    end

    def over?
      won? || draw?
    end

    def won?
      if wins_o? || wins_x?
        return true
      elsif board.turn_count == 9
        return false
      end
    end

    def draw?
      board.turn_count == 9 && !won? ? true : false
    end

    def winner
      return "X" if wins_x?
      return "O" if wins_o?
    end

    def turn
      player = current_player
      current_move = player.move(board)
      if !board.valid_move?(current_move)
        turn
      else
        board.update(current_move, player)
        board.display
      end
    end

    def play
      board.display
      until over?
        turn
      end 
      if won?
        puts "Congratulations #{winner}!" 
      elsif draw?
        puts "Cats Game!" 
      end
    end
end