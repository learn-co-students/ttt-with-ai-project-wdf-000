require 'pry'
class Board

  attr_accessor :cells

  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    self
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(user_input)
    # num = user_input.to_i
    # num = self.cells[user_input.to_i - 1]
    # num
    self.cells[user_input.to_i - 1]
  end

  def full?
    !self.cells[0..8].include?(" ")
  end

  def turn_count
    count = 0
    self.cells[0..8].each do |x|
      if x == "X" || x == "O"
        count += 1
      end
    end
    count
  end
  
  def taken?(user_input)
    self.position(user_input) == "X" || self.position(user_input) == "O"
  end

  def valid_move?(user_input)
    x = user_input.to_i
    x.between?(1,9) && !self.taken?(user_input)
  end

  def update(user_input, player_token) 
    input = player_token.token
    self.cells[user_input.to_i - 1] = input
    # self.position(user_input) = input
  end

 # b = Board.new
 # b.cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "]

  # binding.pry


end
