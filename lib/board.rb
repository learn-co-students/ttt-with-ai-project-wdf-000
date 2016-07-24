class Board
  attr_accessor :cells

  def initialize(cells = nil)
    @cells = Array.new(9, " ")
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

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    self.cells.select{|cell| cell if cell != " "}.count
  end

  def taken?(user_input)
    @cells[user_input.to_i - 1] == "X" || @cells[user_input.to_i - 1] == "O"
  end 

  def valid_move?(user_input)  
    !taken?(user_input) && user_input.to_i.between?(1, 9)
  end

  def update(move, player)
    @cells[move.to_i - 1] = player.token
  end

end
