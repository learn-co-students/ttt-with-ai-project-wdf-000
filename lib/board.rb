class Board
  attr_accessor :cells, :token

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def valid_move?(input)
    !taken?(input) && (1..9).include?(input.to_i)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end