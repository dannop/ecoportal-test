class GameStatus
  def is_tie(board)
    board.all? { |spot| spot == "X" || spot == "O" }
  end

  def is_win(board, i, j, k)
    [board[i], board[j], board[k]].uniq.length == 1
  end

  def is_over(board)
    is_win(board, 0, 1, 2) || is_win(board, 3, 4, 5) || 
    is_win(board, 6, 7, 8) || is_win(board, 0, 3, 6) || 
    is_win(board, 1, 4, 7) || is_win(board, 2, 5, 8) ||
    is_win(board, 0, 4, 8) || is_win(board, 2, 4, 6) 
  end
end