require "./user_interface"
require "./game_status"
require "./player"
require "./bot"

class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    
    @ui = UserInterface.new
    @status = GameStatus.new

    @first_player = Player.new("O")
    @second_player = nil 
    @bot = Bot.new
  end

  def finished
    @status.is_over(@board) || @status.is_tie(@board)
  end

  def start
    @ui.render_board(@board)
    
    until finished
      @first_player.get_entry(@board)
      @bot.eval_board(@board) unless finished
      @ui.render_board(@board)
    end

    @ui.game_over
  end
end

game = Game.new
game.start