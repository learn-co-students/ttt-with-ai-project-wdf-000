
def run_sim(num)
    win = 0
    num.times do 
      a = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      if a.winnner != nil
         win += 1
      end
    end
    puts win
end
  