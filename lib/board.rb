class Board

  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}  "
  end

  def position(num)
    self.cells[(num.to_i - 1)]
  end

  def full?
    cells.include?(" ") ? false : true
  end

  def turn_count
    9 - self.cells.count(" ")
  end

 def taken?(num)
    self.cells[num.to_i - 1] != " " ? true : false
 end

 def valid_move?(num)
   if num.to_i.to_s != num
     return false
   end
    taken?(num) ? false : true
 end

 def update(num, player)
   if valid_move?(num)
     self.cells[num.to_i - 1] = player.token
   end
 end

end
