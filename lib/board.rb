require 'pry'

class Board
  include Concerns::Memorable
  include Concerns::Paramable
  attr_accessor :cells

  def initialize
    @cells = []
    reset!
    # binding.pry
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    display_board(self.cells)
  end

  def position(input)
    self.cells[input_to_index(input)] if is_number?(input)
  end

  def full?
    self.cells.all? {|position| position == "X" || position == "O"}
  end

  def turn_count
    self.cells.select {|cell| cell if cell != " "}.count
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    position(input) == " "
  end

  def update(position, player)
    # binding.pry
    self.cells[position.to_i - 1] = player.token
  end

end