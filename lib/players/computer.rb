module Players
  class Computer < Player

     def move(b)
        x = rand(1..9).to_s
           while b.cells[x.to_i - 1] == "X" || b.cells[x.to_i - 1] == "O"
             x = rand(1..9).to_s
           end
          x

     end



  end
end
