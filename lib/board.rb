class Board

  attr_accessor :cells

  def initialize
    reset!
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

  def position(spot)
    @cells[spot.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    num = 0
    @cells.each do |token|
      if(token == "X" || token == "O")
        num += 1
      end
    end
    num
  end

  def taken?(spot)
    position(spot) == "X" || position(spot) == "O"
  end

  def valid_move?(spot)
    (spot.to_i).between?(1,9) && !taken?(spot)
  end

  def update(spot, player)
    @cells[spot.to_i - 1] = player.token
  end

end