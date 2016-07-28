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

  def position(index)
    @cells[(index.to_i) - 1]
  end

  def full?
    @cells.all?{|cell| cell != " "} ? true : false
  end

  def turn_count

    # @cell.count {|cell| cell != " "}
    count = 0
    num = 0
    while num < 9 do
     if @cells[num] != " "
       count += 1
     end
     num += 1
    end
    count
  end

  def taken?(index)
    !(@cells[index.to_i - 1].nil? || @cells[index.to_i - 1] == " ")
  end

  # Valid move
  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end

end