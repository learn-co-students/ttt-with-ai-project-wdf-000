module Players

  class Computer < Player
    @@positions = []

    def move(board)

      position = "1"
      until !@@positions.include?(position)
        position = rand(10).to_s
      end

      @@positions << position
      
      return position
    end
  end
end
