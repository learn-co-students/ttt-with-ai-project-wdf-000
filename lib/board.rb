class Board
  attr_accessor :cells
  def initialize 
    self.reset!
  end
  def reset!
    @cells = Array.new(9, ' ')
  end
  def display
    puts" #{@cells[0..2].join(' | ')} \n#{'-'*11}\n #{@cells[3..5].join(' | ')} \n#{'-'*11}\n #{@cells[6..8].join(' | ')} \n"
  end
  def position(input)
    @cells[input.to_i - 1]
  end
  def full?
    turn_count == @cells.count
  end
  def turn_count
    @cells.select {|cell| cell.match(/[XO]/)}.count 
  end
  def taken?(cell)
    !!@cells[cell.to_i - 1].match(/[XO]/)
  end
  def valid_move?(cell)
    cell.to_i.between?(1,9) && !taken?(cell)
  end
  def update(cell, player)
    @cells[cell.to_i - 1] = player.token
  end
end
