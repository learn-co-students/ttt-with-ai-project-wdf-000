require 'pry'
class Game
  
    WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5], 
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [0,4,8], 
    [2,4,6]
  ]
  
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def full?
    self.cells.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !self.won? && self.board.full?
  end

  def over?
    self.won? || self.board.full? || self.draw?
  end

  def won?
    win_status = false
    WIN_COMBINATIONS.each do |win|
      if (self.board.cells[win[0]] == "X" && self.board.cells[win[1]] == "X" && self.board.cells[win[2]] == "X")
        win_status = true
      elsif (self.board.cells[win[0]] == "O" && self.board.cells[win[1]] == "O" && self.board.cells[win[2]] == "O")
        win_status = true
      end
    end
    win_status
  end

  def winner
    token = nil
    WIN_COMBINATIONS.each do |win|
      if (self.board.cells[win[0]] == "X" && self.board.cells[win[1]] == "X" && self.board.cells[win[2]] == "X")
        token = "X"
      elsif (self.board.cells[win[0]] == "O" && self.board.cells[win[1]] == "O" && self.board.cells[win[2]] == "O")
        token = "O"

      end
    end
    token
  end
    # if win = won?
    #   self.winner = self.board.cells[win[0]]
    # if self.won?
    #   self.board.cells[self.won?[0]]
#   end
# end

  def turn
  #   move_value = current_player.move(board)
  #   if !board.valid_move? move_value
  #     turn
  #   else
  #     board.update(move_value, current_player)
  #     move_value
  #   end
  # end

    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end

  def play
    until over?
      if self.current_player.class == Players::Human
        puts "#{current_player.token}, it's your turn."
        end
        turn
      end

    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cats Game!"
    end
  end

  # binding.pry

end



