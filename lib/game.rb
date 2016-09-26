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

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    won? || draw? || board.full?
  end

  def draw?
    !won? && board.full?
  end

  def won?
    winner = false
    WIN_COMBINATIONS.each do |win_combo|

      if board.cells[win_combo[0]]== "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X"
        winner = true
      elsif board.cells[win_combo[0]]== "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        winner = true
      end
    end
    winner
  end

  def winner
    token = nil
    WIN_COMBINATIONS.each do |win_combo|

      if board.cells[win_combo[0]]== "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X"
        token = "X"
      elsif board.cells[win_combo[0]]== "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        token = "O"
      end
    end
    token
  end

  def turn
    move = current_player.move(board)
#    puts "Please enter 1-9:"
#    input = gets.chomp
#    index = input(index)

    if board.valid_move?(move)
      board.update(move, current_player)
    else
      turn
    end
  end

  def play
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
