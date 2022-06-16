require "./user_interface"
require "./game_status"
require "./human"
require "./computer"
require "./helper"

class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    
    @ui = UserInterface.new
    @status = GameStatus.new

    @first_player = Human.new("O")
    @second_player = Human.new("X") 

    @first_bot = Computer.new("X")
    @second_bot = Computer.new("O")
  end

  def finished
    @status.is_over(@board) || @status.is_tie(@board)
  end

  def start_h_vs_c(difficulty)
    @ui.render_board(@board)
    
    until finished
      @first_player.get_entry(@board)
      if finished
        @ui.render_board(@board)
        if @status.is_tie(@board)
          @ui.game_tied
        else
          @ui.you_win
        end
      else 
        @first_bot.eval_board(@board, difficulty)
        @ui.render_board(@board)
      end 
    end

    @ui.game_over
  end

  def start_h_vs_h
    @ui.render_board(@board)
    
    until finished
      @first_player.get_entry(@board)
      @ui.render_board(@board)
      unless finished
        @second_player.get_entry(@board) 
        @ui.render_board(@board)
      end
    end

    @ui.game_over
  end

  def start_c_vs_c
    @ui.render_board(@board)
    
    until finished
      @second_bot.eval_board(@board, 0)
      @ui.current_turn(@second_bot.get_marker)
      @ui.render_board(@board)
      unless finished
        @first_bot.eval_board(@board, 0) 
        @ui.current_turn(@first_bot.get_marker)
        @ui.render_board(@board)
      end
    end

    @ui.game_over
  end

  def run 
    option = nil
    last_option = nil 

    until option
      if last_option
        option = last_option
        last_option = nil 
      else
        @ui.render_main_menu
        option = gets.chomp.to_i 
      end

      if Helper.valid_entry?(option, 0, 2)
        if option == 0 # Player vs Computer 
          @ui.render_difficulty
          difficulty_option = gets.chomp.to_i
          last_option = option if difficulty_option != 3

          if Helper.valid_entry?(difficulty_option, 0, 3)
            start_h_vs_c(difficulty_option)
          elsif difficulty_option != 3 # Selected go back
            @ui.invalid_entry 
          end
        elsif option == 1 # Player vs Player 
          start_h_vs_h()
        else # Computer vs Computer
          start_c_vs_c()
        end  
      else
        @ui.invalid_entry
      end

      option = nil
      @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    end
  end
end

game = Game.new
game.run