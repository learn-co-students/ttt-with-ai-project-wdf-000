require 'pry'

class Board
  attr_accessor :cells, :game_board

  def initialize
    reset!
  end

  def reset!
    self.cells = [
      " ", " ", " ",
      " ", " ", " ",
      " ", " ", " "
    ]
  end

  def view_board
    self.cells
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(place)
    self.cells[place.to_i-1]
  end

  def update(position, player)
    if !taken? position
      self.cells[position.to_i-1] = player.token
    end
    self.cells
  end

  def full?
    return_value = true
    self.cells.each do |position|
      if position == " "
        return_value = false
      end
    end
    return_value
  end

  def turn_count
    count = 0
    self.cells.each do |position|
      if position != " "
        count += 1
      end
    end
    count
  end

  def taken?(position)
    x = self.cells[position.to_i-1] == " "
    !x
  end

  def valid_move?(move)
    move.to_i>0 && move.to_i<10 && !taken?(move) && move.scan(/[a-z]+/).length == 0
  end

end
