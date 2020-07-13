require 'pry'

module Players

class Computer < Player

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]

def move(board)
  super
  other_player = ""
  self.token == "X" ? other_player = "O" : other_player = "X"

  move_hash = {}

  available_moves = look_at_board(board, " ")
  available_moves.each{|move| move_hash[move] = []}
  enemy_moves = look_at_board(board, other_player)
  WIN_COMBINATIONS.each do |combo|
      enemy_moves.each do |move|
        if combo.include?(move)
          new_combo = combo - enemy_moves
          if new_combo.length == 1 && available_moves.include?(new_combo[0])
            move_hash[new_combo[0]].push("!!!")
          else new_combo.select!{|x| available_moves.include?(x)}
            new_combo.each{|x| move_hash[x].push("x")}
          end
        end
      end
    end

  sneak_hash = {}
  WIN_COMBINATIONS.each do |combo|
    enemy_moves.each do |move|
      if combo.include?(move)
        new_combo = combo.select{|x| x != move && available_moves.include?(x)}
        new_combo.each do |x|
          if sneak_hash[x]
            sneak_hash[x].push("x")
          else
            sneak_hash[x] = ["x"]
          end
        end
      end
    end
  end

  emergency = move_hash.select{|key, value| value.include?("!!!")}.keys.sample

  if sneak_hash.values.include?("x")
    max_sneaky = sneak_hash.max_by{|key, value| value.length}.flatten.length - 1
    sneak_move = sneak_hash.select{|key, value| value.length == max_sneaky}.keys.sample
  end

  max_amt = move_hash.max_by {|key, value| value.length}.flatten.length - 1

  move = move_hash.select {|key, value| value.length == max_amt}.keys.sample

  if emergency
    (emergency + 1).to_s
  elsif sneak_move
    (sneak_move + 1).to_s
  else
    (move + 1).to_s
  end

end

def look_at_board(board, symbol)
  free_cells = []
  board.cells.each_with_index {|cell,index| free_cells << index if cell == symbol}
  free_cells
end

end

end
