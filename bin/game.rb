# frozen_string_literal: true

class Game
  def initialize(board)
    @game_board = board

    @game_board.ask_names
    @game_board.draw
  end

  def start
    while @game_board.has_movs
      @game_board.mark
      @game_board.draw
    end

    if @game_board.winner
      puts "#{@game_board.winner.name} WINS!!"
    else
      puts 'This is a draw'
    end
  end
end
