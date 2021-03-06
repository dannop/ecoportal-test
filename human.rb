class Human 
  def initialize(marker)
    @marker = marker
    @ui = UserInterface.new
  end

  def get_entry(board)
    @ui.ask_next_move(@marker)
    spot = nil

    until spot
      spot = gets.chomp.to_i
      if Helper.valid_entry?(spot, 0, 8) && Helper.place_empty?(board[spot])
        board[spot] = @marker
      else
        @ui.invalid_entry
        spot = nil
      end
    end
  end
end