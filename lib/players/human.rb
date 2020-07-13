module Players
  class Human < Player
    attr_reader :token

    def move(board)
      input = gets.strip
    end

  end


end
