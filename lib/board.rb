class Board
  attr_accessor :cells

  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    input = input.to_i
    input = input - 1
    self.cells[input]
  end

  def full?
    self.cells.all?{|value| value == "X" || value == "O"}
  end

  def turn_count
    count = 0
    self.cells.each do |value|
      if value == "X" || value == "O"
        count += 1
      end
    end
    count.to_i
  end

  def taken?(input)
    input = input.to_i - 1
    if self.cells[input] == "X" || self.cells[input] == "O"
      return true
    else
      false
    end
  end

  def valid_move?(input)
    input = input.to_i
    if input < 1 || input > 9
      false
    else
      !self.taken?(input)
    end
  end

  def update(index, player)
    input = player.token
    self.cells[index.to_i - 1] = input

  end
end
