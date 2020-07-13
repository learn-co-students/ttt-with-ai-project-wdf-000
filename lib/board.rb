class Board
  attr_accessor :cells, :valid_moves
  TOKENS = ["X", "O"]

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
    @valid_moves = (1..9).to_a
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.all? { |position| token?(position) }
  end

  def turn_count
    cells.count { |position| token?(position) }
  end

  def taken?(input)
    token?(cells[input.to_i - 1])
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9)
  end

  def update(input, player)
    input = input.to_i

    valid_moves.delete(input)
    cells[input - 1] = player.token
  end

  def unplayed?
    cells == Array.new(9, " ")
  end

  private
  def token?(input)
    TOKENS.include?(input)
  end
end
