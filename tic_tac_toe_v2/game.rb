require_relative "board"
require_relative "human_player"

class Game

  def initialize(size, *player_mark)
    @players = []
    player_mark.each { |mark| @players << HumanPlayer.new(mark) }
    @board = Board.new(size)
    @current_player = @players[0]
  end

  def switch_turn
    @players.rotate!
    @current_player = @players[0]
  end

  def play
    while @board.empty_positions?
      @board.print
      position = @current_player.get_position
      @board.place_mark(position, @current_player.mark)
      if @board.win?(@current_player.mark)
        puts "Victory! Player " + @current_player.mark.to_s + " has won!"
        return
      else
        self.switch_turn
      end
    end
    puts "Draw"
  end


end