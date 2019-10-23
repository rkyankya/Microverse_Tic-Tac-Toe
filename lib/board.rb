# frozen_string_literal: true

class Board
  attr_reader :winner
  attr_reader :has_movs
  attr_reader :player_turn
  attr_reader :blocks

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    reset

    @winner_positions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  end

  def reset
    @blocks = Array.new(9, ' ')
    @player1.move = Array.new(9, ' ')
    @player2.move = Array.new(9, ' ')
    @player_turn = @player1
    @winner = nil
    @has_movs = true
  end

  def mark(move)
    if @blocks[move] == ' '
      @blocks[move] = player_turn.symbol
      player_turn.mark_symbol(move)

      @winner = check_winner(player_turn) ? player_turn : nil
      @has_movs = !@winner && count_empties.positive? ? true : false

      @player_turn = @player_turn == @player1 ? @player2 : @player1
      true
    else
      false
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
end
