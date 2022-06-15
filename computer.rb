class Computer 
  def initialize(marker)
    @marker = marker
    @status = GameStatus.new
  end

  def get_best_move(board, difficulty)
    available_spaces = []
    best_move = nil

    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end

    available_spaces.each do |as|
      board[as.to_i] = @marker

      if @status.is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @hum
        
        if @status.is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end

    if best_move
      return best_move
    else
      # Here different difficultyies will be implemented using 0 = easy, 1 = medium, 2 = hard
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def eval_board(board, difficulty)
    spot = nil

    until spot
      if board[4] == "4"
        spot = 4
        board[spot] = @marker
      else
        spot = get_best_move(board, difficulty)
        if board[spot] != "X" && board[spot] != "O"
          board[spot] = @marker
        else
          spot = nil
        end
      end
    end
  end

  def get_marker
    return @marker
  end
end