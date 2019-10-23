# frozen_string_literal: true

class Board
  attr_reader :winner
  attr_reader :has_movs
  attr_reader :player_turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @blocks = Array.new(9, ' ')
    @player_turn = player1
    @winner = nil
    @has_movs = true

    @winner_positions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  end

  def mark(move)
    if @blocks[move] == ' '
      @blocks[move] = player_turn.symbol
      player_turn.mark_symbol(move)

      @winner = check_winner(player_turn) ? player_turn : nil
      @has_movs = !@winner && count_empties.positive? ? true : false

      @player_turn = @player_turn == @player1 ? @player2 : @player1
    else
      key_tocontinue 'that mark can\'t be done, because the block is not empty, try again...'
    end
  end

  def check_winner(player)
    @winner_positions.any? do |i|
      i.all? { |item| player.move[item] != ' ' }
    end
  end

  def count_empties
    @blocks.count { |i| i == ' ' }
  end

  # Displays positions of the board that have been taken
  def draw
    system 'clear'
    mv = @blocks # Marks X for position occupied by player1
    printf(" 1 | 2 | 3        %s | %s | %s \n", mv[0], mv[1], mv[2])
    puts '-----------      -----------'
    printf(" 4 | 5 | 6   =>   %s | %s | %s \n", mv[3], mv[4], mv[5])
    puts '-----------      -----------'
    printf(" 7 | 8 | 9        %s | %s | %s \n", mv[6], mv[7], mv[8])

    puts '============================'
  end

  def key_tocontinue(msg)
    system 'clear'
    puts msg + "\npress a key to continue..."
    STDIN.getch
  end
end
