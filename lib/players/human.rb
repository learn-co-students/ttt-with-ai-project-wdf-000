module Players
  class Human < Player
    attr_accessor :board
    def move(board = nil)
      gets.strip
    end
  end
end