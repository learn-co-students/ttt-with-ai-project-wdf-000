module Players
class Computer < Player
    
  def o_token
    self.token == "X" ? "O" : "X" 
  end

  def move(board)      
    if board.turn_count == 0
      [1,3,7,9,5].sample.to_s
    elsif board.cells[4].strip == ""
      "5"
    elsif board.turn_count == 1
      [1,3,7,9].sample
    else
      ai_move(board).to_s
    end
  end    

  def ai_move(board)

    comb = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
      ]

    arr = board.cells

    comb.each do |c|
      if (arr[c[0]] == o_token && arr[c[1]] == o_token && arr[c[2]].strip=="")
        return (c[2] + 1)
      elsif arr[c[0]] == o_token && arr[c[1]].strip == "" && arr[c[2]]== o_token
        return (c[1] + 1)
      elsif arr[c[0]].strip == "" && arr[c[1]] == o_token && arr[c[2]]== o_token
        return (c[0] + 1)
      end
    end

    comb.each do |c|
      if (arr[c[0]] == self.token && arr[c[1]] == self.token && arr[c[2]].strip == " ")
        return (c[2] + 1)
      elsif arr[c[0]] == self.token && arr[c[1]].strip == "" && arr[c[2]]== self.token
        return (c[1] + 1)
      elsif arr[c[0]].strip == "" && arr[c[1]] == self.token && arr[c[2]]== self.token
        return (c[0] + 1)
      end
    end

    comb.each do |c|
      if arr[c[0]] == self.token && arr[c[1]].strip == "" && arr[c[2]].strip==""
        return (c[2] + 1)
      elsif arr[c[0]].strip == "" && arr[c[1]] == self.token && arr[c[2]].strip== ""
        return (c[0] + 1)
      elsif arr[c[0]].strip == "" && arr[c[1]].strip == "" && arr[c[2]]== self.token
        return (c[0] + 1)
      end 
    end          
    rand(1..9)
  end

    # def opp_takes_the_corner_index_opposite_side(board)
    #   arr = board.cells    
    #   index = arr.index(o_token) || arr.index(o_token) || arr.index(o_token) || arr.index(o_token) 
    #   if index == 0
    #     9
    #   elsif index == 2
    #     7
    #   elsif index == 6
    #     3
    #   else
    #     1
    #   end 
    # end

    # def opp_takes_the_corner?(board)
    #   arr = board.cells
    #   arr.index(o_token) == 0 || arr.index(o_token) == 2 || arr.index(o_token) == 7 || arr.index(o_token) == 9
    # end

    # def corner_move(board)
    #   # binding.pry
    #   arr = board.cells
    #   if arr[0] == o_token && arr[8].strip == ""
    #     return 9
    #   elsif arr[8] == o_token && arr[0].strip == ""
    #     return 1
    #   elsif arr[2] == o_token && arr[6].strip == ""
    #     return 7
    #   elsif arr[6] == o_token && arr[2].strip == ""
    #     return 3
    #   else
    #     [1,3,7,9,5].sample
    #   end 
    # end

end
end



