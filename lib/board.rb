class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input_to_index(input)
    index ? @cells[index] : nil
  end

  def full?
    @cells.all? {|position| position == "X" || position == "O"}
  end

  def turn_count
    @cells.select {|position| position == "X" || position == "O"}.count
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    position(input) && !taken?(input)
  end

  def update(input, player)
    index = input_to_index(input)
    @cells[index] = player.token
  end

  private
  def input_to_index(input)
    input.scan(/\b[1-9]\b/)[0] ? input.to_i - 1 : nil
  end

end