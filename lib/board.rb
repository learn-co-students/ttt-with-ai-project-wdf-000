class Board

  attr_accessor :cells

  def initialize
    @cells = self.new_board
  end

  def reset!
    @cells.clear
    @cells = self.new_board
  end

  def new_board
    Array.new(9) {" "}
  end

  def display
    separator = "-----------"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "#{separator}"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "#{separator}"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(position)
    self.cells[input_to_index(position)]
  end

  def full?
    !self.cells.any? { |cell| cell == " " }
  end

  def turn_count
    count = 0
    self.cells.each { |cell|
      count += 1 if cell == "X" || cell == "O"
    }

    return count
  end

  def taken?(position)
    cell = self.cells[input_to_index(position)]
    return cell == "X" || cell == "O"
  end

  def valid_move?(position)
    index = self.input_to_index(position)
    index.between?(0,8) && !self.taken?(position)
  end

  def update(position, player)
    index = self.input_to_index(position)
    cells[index] = player.token
  end



  def input_to_index(position)
    position.to_i - 1
  end

end
