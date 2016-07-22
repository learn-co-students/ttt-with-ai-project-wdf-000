require 'pry'
module Players
  class Computer < Player

  def move(board, depth=0, best_score={})
    return 0 if board.draw?
    return -1 if board.over?

    board.available_spaces.each do |space|
      board.test_update(space, board.current_player)
      # binding.pry
      best_score[space] = -1 * move(board, depth + 1, {})
      board.reset_space_at(space)
    end

    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]

    if depth == 0
      # binding.pry
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end
  end

  end

end
