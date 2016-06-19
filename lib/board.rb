class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i - 1]
  end

  def full?
    !@cells.any?{|x| x == " "}
  end

  def turn_count
    @cells.count{|x| x != " "}
  end

  def taken?(pos)
    @cells[pos.to_i - 1] != " "
  end

  def valid_move?(pos)
    if pos.to_i > 0 and pos.to_i < 10
      !self.taken?(pos)
    end
  end

  def update(pos,player)
    @cells[pos.to_i - 1] = player.token
  end
end
