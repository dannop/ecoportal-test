class Player 
  def initialize(marker)
    @marker = marker
    @ui = UserInterface.new
  end

  def verify_entry(value)
    return value.is_a?(Integer) && value >= 0 && value < 9
  end

  def get_entry(board)
    @ui.ask_next_move
    spot = nil

    until spot
      spot = gets.chomp.to_i
      if verify_entry(spot) && board[spot] != "X" && board[spot] != "O"
        board[spot] = @marker
      else
        @ui.invalid_entry
        spot = nil
      end
    end
  end
end