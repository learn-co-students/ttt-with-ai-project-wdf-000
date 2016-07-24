require 'pry'
module Players
class Computer < Player
  attr_reader :token, :board, :game

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  CORNERS = [1, 3, 7, 9]
  EDGE = [2, 4, 6, 8]

  def move(board)
    #this part is about how to take a win or block a win
    # cell = board.cells
    # WIN_COMBINATIONS.each do |combo|
    #   if cell[combo[0]] == cell[combo[1]] && cell[combo[0]] != " " && cell[combo[2]] == " "
    #     return (combo[2] + 1)
    #   elsif cell[combo[0]] == cell[combo[2]] && cell[combo[0]] != " " && cell[combo[1]] == " "
    #     return (combo[1] + 1)
    #   elsif cell[combo[1]] == cell[combo[2]] && cell[combo[1]] != " " && cell[combo[0]] == " "
    #     return (combo[0] + 1)
      
    if board.cells[WIN_COMBINATIONS[0][0]] == board.cells[WIN_COMBINATIONS[0][1]] && board.cells[WIN_COMBINATIONS[0][0]] != " " && board.cells[WIN_COMBINATIONS[0][2]] == " "
      return WIN_COMBINATIONS[0][2]+1
    elsif board.cells[WIN_COMBINATIONS[0][0]] == board.cells[WIN_COMBINATIONS[0][2]] && board.cells[WIN_COMBINATIONS[0][0]] != " " && board.cells[WIN_COMBINATIONS[0][1]] == " "
      return WIN_COMBINATIONS[0][1]+1
    elsif board.cells[WIN_COMBINATIONS[0][1]] == board.cells[WIN_COMBINATIONS[0][2]] && board.cells[WIN_COMBINATIONS[0][1]] != " " && board.cells[WIN_COMBINATIONS[0][0]] == " "
      return WIN_COMBINATIONS[0][0]+1
    elsif board.cells[WIN_COMBINATIONS[1][0]] == board.cells[WIN_COMBINATIONS[1][1]] && board.cells[WIN_COMBINATIONS[1][0]] != " " && board.cells[WIN_COMBINATIONS[1][2]] == " "
      return WIN_COMBINATIONS[1][2]+1
    elsif board.cells[WIN_COMBINATIONS[1][0]] == board.cells[WIN_COMBINATIONS[1][2]] && board.cells[WIN_COMBINATIONS[1][0]] != " " && board.cells[WIN_COMBINATIONS[1][1]] == " "
      return WIN_COMBINATIONS[1][1]+1
    elsif board.cells[WIN_COMBINATIONS[1][1]] == board.cells[WIN_COMBINATIONS[1][2]] && board.cells[WIN_COMBINATIONS[1][1]] != " " && board.cells[WIN_COMBINATIONS[1][0]] == " "
      return WIN_COMBINATIONS[1][0]+1

    elsif board.cells[WIN_COMBINATIONS[2][0]] == board.cells[WIN_COMBINATIONS[2][1]] && board.cells[WIN_COMBINATIONS[2][0]] != " " && board.cells[WIN_COMBINATIONS[2][2]] == " "
      return WIN_COMBINATIONS[2][2]+1
    elsif board.cells[WIN_COMBINATIONS[2][0]] == board.cells[WIN_COMBINATIONS[2][2]] && board.cells[WIN_COMBINATIONS[2][0]] != " " && board.cells[WIN_COMBINATIONS[2][1]] == " "
      return WIN_COMBINATIONS[2][1]+1
    elsif board.cells[WIN_COMBINATIONS[2][1]] == board.cells[WIN_COMBINATIONS[2][2]] && board.cells[WIN_COMBINATIONS[2][1]] != " " && board.cells[WIN_COMBINATIONS[2][0]] == " "
      return WIN_COMBINATIONS[2][0]+1
    elsif board.cells[WIN_COMBINATIONS[3][0]] == board.cells[WIN_COMBINATIONS[3][1]] && board.cells[WIN_COMBINATIONS[3][0]] != " " && board.cells[WIN_COMBINATIONS[3][2]] == " "
      return WIN_COMBINATIONS[3][2]+1
    elsif board.cells[WIN_COMBINATIONS[3][0]] == board.cells[WIN_COMBINATIONS[3][2]] && board.cells[WIN_COMBINATIONS[3][0]] != " " && board.cells[WIN_COMBINATIONS[3][1]] == " "
      return WIN_COMBINATIONS[3][1]+1
    elsif board.cells[WIN_COMBINATIONS[3][1]] == board.cells[WIN_COMBINATIONS[3][2]] && board.cells[WIN_COMBINATIONS[3][1]] != " " && board.cells[WIN_COMBINATIONS[3][0]] == " "
      return WIN_COMBINATIONS[3][0]+1

    elsif board.cells[WIN_COMBINATIONS[4][0]] == board.cells[WIN_COMBINATIONS[4][1]] && board.cells[WIN_COMBINATIONS[4][0]] != " " && board.cells[WIN_COMBINATIONS[4][2]] == " "
      return WIN_COMBINATIONS[4][2]+1
    elsif board.cells[WIN_COMBINATIONS[4][0]] == board.cells[WIN_COMBINATIONS[4][2]] && board.cells[WIN_COMBINATIONS[4][0]] != " " && board.cells[WIN_COMBINATIONS[4][1]] == " "
      return WIN_COMBINATIONS[4][1]+1
    elsif board.cells[WIN_COMBINATIONS[4][1]] == board.cells[WIN_COMBINATIONS[4][2]] && board.cells[WIN_COMBINATIONS[4][1]] != " " && board.cells[WIN_COMBINATIONS[4][0]] == " "
      return WIN_COMBINATIONS[4][0]+1
    elsif board.cells[WIN_COMBINATIONS[5][0]] == board.cells[WIN_COMBINATIONS[5][1]] && board.cells[WIN_COMBINATIONS[5][0]] != " " && board.cells[WIN_COMBINATIONS[5][2]] == " "
      return WIN_COMBINATIONS[5][2]+1
    elsif board.cells[WIN_COMBINATIONS[5][0]] == board.cells[WIN_COMBINATIONS[5][2]] && board.cells[WIN_COMBINATIONS[5][0]] != " " && board.cells[WIN_COMBINATIONS[5][1]] == " "
      return WIN_COMBINATIONS[5][1]+1
    elsif board.cells[WIN_COMBINATIONS[5][1]] == board.cells[WIN_COMBINATIONS[5][2]] && board.cells[WIN_COMBINATIONS[5][1]] != " " && board.cells[WIN_COMBINATIONS[5][0]] == " "
      return WIN_COMBINATIONS[5][0]+1

    elsif board.cells[WIN_COMBINATIONS[6][0]] == board.cells[WIN_COMBINATIONS[6][1]] && board.cells[WIN_COMBINATIONS[6][0]] != " " && board.cells[WIN_COMBINATIONS[6][2]] == " "
      return WIN_COMBINATIONS[6][2]+1
    elsif board.cells[WIN_COMBINATIONS[6][0]] == board.cells[WIN_COMBINATIONS[6][2]] && board.cells[WIN_COMBINATIONS[6][0]] != " " && board.cells[WIN_COMBINATIONS[6][1]] == " "
      return WIN_COMBINATIONS[6][1]+1
    elsif board.cells[WIN_COMBINATIONS[6][1]] == board.cells[WIN_COMBINATIONS[6][2]] && board.cells[WIN_COMBINATIONS[6][1]] != " " && board.cells[WIN_COMBINATIONS[6][0]] == " "
      return WIN_COMBINATIONS[6][0]+1
    elsif board.cells[WIN_COMBINATIONS[7][0]] == board.cells[WIN_COMBINATIONS[7][1]] && board.cells[WIN_COMBINATIONS[7][0]] != " " && board.cells[WIN_COMBINATIONS[7][2]] == " "
      return WIN_COMBINATIONS[7][2]+1
    elsif board.cells[WIN_COMBINATIONS[7][0]] == board.cells[WIN_COMBINATIONS[7][2]] && board.cells[WIN_COMBINATIONS[7][0]] != " " && board.cells[WIN_COMBINATIONS[7][1]] == " "
      return WIN_COMBINATIONS[7][1]+1
    elsif board.cells[WIN_COMBINATIONS[7][1]] == board.cells[WIN_COMBINATIONS[7][2]] && board.cells[WIN_COMBINATIONS[7][1]] != " " && board.cells[WIN_COMBINATIONS[7][0]] == " "
      return WIN_COMBINATIONS[7][0]+1

    # otherwise take the middle
    elsif board.cells[4] == " "
      return 5

    # if the opponent has two opposite corners and you have the middle, taking a corner leads to a loss
    elsif board.cells[0] == board.cells[8] && board.cells[0] != " " && board.cells[0] != "#{self.token}"
      return EDGE.sample
    elsif board.cells[2] == board.cells[6] && board.cells[2] != " " && board.cells[0] != "#{self.token}"
      return EDGE.sample
    
    # otherwise take the corners first. take the opposite corner first, then take any corner
    elsif board.cells[0] != " " && board.cells[8] == " "
      9
    elsif board.cells[2] != " " && board.cells[6] == " "
      7
    elsif board.cells[6] != " " && board.cells[2] == " "
      3
    elsif board.cells[8] != " " && board.cells[0] == " "
      1
    elsif board.cells[0] == " "
      1
    elsif board.cells[2] == " "
      3
    elsif board.cells[6] == " "
      7
    elsif board.cells[8] == " "
      9
    else
      rand(1..9)
    end
  end
end
end