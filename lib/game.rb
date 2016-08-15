require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board=Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    if self.board.turn_count % 2 == 0
      current_token = player_1
    else
      current_token = player_2
    end
    current_token

  end

  def over?
    won? || self.board.full?
  end

  def won?
    won_status = false
    WIN_COMBINATIONS.each do |win|
      if (self.board.view_board[win[0]] == "X" && self.board.view_board[win[1]] == "X" && self.board.view_board[win[2]] == "X")
        won_status = true
      elsif (self.board.view_board[win[0]] == "O" && self.board.view_board[win[1]] == "O" && self.board.view_board[win[2]] == "O")
        won_status = true
      end
    end
    won_status
  end

  def draw?
    !won? && over?
  end

  def winner
    won_token = ""
    WIN_COMBINATIONS.each do |win|
      if (self.board.view_board[win[0]] == "X" && self.board.view_board[win[1]] == "X" && self.board.view_board[win[2]] == "X")
        won_token = "X"
      elsif (self.board.view_board[win[0]] == "O" && self.board.view_board[win[1]] == "O" && self.board.view_board[win[2]] == "O")
        won_token = "O"
      end
    end
    if won_token == ""
      return nil
    end
    won_token
  end


  def turn
    move_value = current_player.move(board)
    if !board.valid_move? move_value
        turn
    else
       board.update(move_value, current_player)
       move_value
    end
  end

  def play
    until draw? || won?
      turn
      play
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
