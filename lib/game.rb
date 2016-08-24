require 'pry'
class Game
  attr_accessor :player_1, :player_2
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
                    ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"),board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # def current_player
  #   # find the current player by finding the last token
  #   count = board.turn_count.to_i
  #   if board.position(count) == player_1
  #     @current_player = player_2
  #   else
  #     @current_player = player_1
  #   end
  # end
  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end


  def over?
    # board.full?
    self.won? || self.draw?
  end
  def draw?
    self.board.full? && !self.won?
  end

  def position_taken?(index)

     board.cells[index]== "X" || board.cells[index] == "O"

   end


       def won?
         WIN_COMBINATIONS.detect do |combo|
           @board.cells[combo[0]] == @board.cells[combo[1]] &&
           @board.cells[combo[1]] == @board.cells[combo[2]] &&
           @board.taken?(combo[0]+1)
         end
       end

  # def winner
  #   if self.won?
  #     if self.position_taken?(board.turn_count - 1) == false
  #       @winner = "X"
  #     else
  #       @winner =  "O"
  #     end
  #   end
  # end

    def winner
      if winn = won?
        @winner = self.board.cells[winn[0]]
      end
    end

    def turn
      player = current_player
      current_move = player.move(self.board)
      if !!self.board.valid_move?(current_move) == false
        turn
      else
        puts "Turn: #{self.board.turn_count+1}"
        self.board.display
        self.board.update(current_move, player)
        puts "#{player.token} moved #{current_move}"
        self.board.display
      end
    end

    def play
      # puts "enter a value"
        while !self.over?
          self.turn
          if won?
            break
          elsif draw?
            break
          end
        end
        if won?
          puts "Congratulations #{self.winner}!"
        elsif draw?
          puts "Cats Game!"
        end

    end


end





# class Game
#   attr_accessor :board, :player_1, :player_2
#   WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [1,4,7],
#     [2,5,8],
#     [0,4,8],
#     [6,4,2]
#   ]
#
#   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
#     @board = board
#     @player_1 = player_1
#     @player_2 = player_2
#   end
#
#   def over?
#     won? || draw?
#   end
#
#   def current_player
#     @board.turn_count % 2 == 0 ? @player_1 : @player_2
#   end
#
#   def winner
#     if winning_combo = won?
#       @winner = @board.cells[winning_combo.first]
#     end
#   end
#
#   def turn
#     player = current_player
#     current_move = player.move(@board)
#     if !@board.valid_move?(current_move)
#       turn
#     else
#       puts "Turn: #{@board.turn_count+1}\n"
#       @board.display
#       @board.update(current_move, player)
#       puts "#{player.token} moved #{current_move}"
#       @board.display
#       puts "\n\n"
#     end
#   end
#
#   def play
#     while !over?
#       turn
#     end
#     if won?
#       puts "Congratulations #{winner}!"
#     elsif draw?
#       puts "Cats Game!"
#     end
#   end
#
#   def won?
#     WIN_COMBINATIONS.detect do |combo|
#       @board.cells[combo[0]] == @board.cells[combo[1]] &&
#       @board.cells[combo[1]] == @board.cells[combo[2]] &&
#       @board.taken?(combo[0]+1)
#     end
#   end
#
#   def draw?
#     @board.full? && !won?
#   end
# end
