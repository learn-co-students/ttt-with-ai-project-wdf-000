require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @board = Board
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    if @cells.any? {|position| position == " "}
      false
    else
      true
    end
  end

  def turn_count
    turns = 0
    @cells.each do |turn|
    if turn == "X" || turn == "O"
      turns += 1
    end
  end
    return turns
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    move = player.token
    cells[input.to_i-1] = move
  end
end
