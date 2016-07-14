require 'pry'
module Players
  class Computer < Player
    attr_accessor :center, :edges, :corners

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

    def initialize(token)
      super
      # basic board definitions
      @center = ["5"]
      @edges = ["2", "4", "6", "8"]
      @corners = ["1", "3", "7", "9"]
    end

    def move(board)
      # set opponents_token
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"

      # updates all available positions
      available_moves = update_available_moves(board)

      # computer move logic
      case
      # 1st game move
      when board.turn_count == 0
        # randomize corners and pick one
        return pick_random(self.corners)
      # 3rd global move & center open
      when board.turn_count < 3 && board.valid_move?(center.first)
        # if opponent in edge
        if edges.count != 4
          # take furthest corner from that edge
          return take_furthest_corner(self.edges)
        else
          # else take center
          return self.center.pop
        end
      # 3rd global move & center NOT open
      when board.turn_count < 3 && !board.valid_move?(center.first)
        return pick_random(self.corners)
      # 4th global move & diagonal full
      when board.turn_count < 4 && diagonal_full(board) == true
          return pick_random(self.edges)
      else
        # detect if self about to win
        if detect_win(board, self.token).class == Array
          incoming_win = detect_win(board, self.token)
          return block_or_make_win(incoming_win, board)
        # detect if opponent about to win
        elsif detect_win(board, opponent_token).class == Array
          incoming_win = detect_win(board, opponent_token)
          return block_or_make_win(incoming_win, board)
        else
        # pick a random move (this can be done better)
          return pick_random(available_moves.flatten)
        end
      end # end case

    end

    def diagonal_full(board)
      diagonal_locations = [["1", "5", "9"], ["3", "5", "7"]]
      # store diagonal states in results
      results = []
      diagonal_locations.each do |diagonal|
        results << diagonal.collect {|pos| board.taken?(pos) }
      end
      results.any? {|arr| arr.uniq.count == 1}
    end

    def pick_random(location)
      # shuffle and remove from available_moves
      location.shuffle!
      location.pop
    end


    def take_furthest_corner(edges)
      if edges.include?("2") == false
        return pick_random(["7", "9"])
      elsif edges.include?("4") == false
        return pick_random(["3", "9"])
      elsif edges.include?("6") == false
        return pick_random(["1", "7"])
      elsif edges.include?("8") == false
        return pick_random(["1", "3"])
      end
      binding.pry
    end

    def update_available_moves(board)
      position_locations = [self.center, self.edges, self.corners]
      position_locations.each do |locations|
        locations.delete_if {|position| !board.valid_move?(position) }
      end
    end

    # check all combinations for incoming win
    def detect_win(board, token)
      WIN_COMBINATIONS.each do |combination|
        collection = combination.collect { |element| board.cells[element] }
        if collection.count(token) == 2 && collection.include?(" ")
          return combination
        end
      end
      false
    end

    # check combination in board for an empty position, return the coresponding combination element
    def block_or_make_win(combination, board)
      win_block = combination.detect {|element| element if board.cells[element] == " "} + 1
      return win_block.to_s
    end

  end
end