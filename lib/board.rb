# frozen_string_literal: true

class Board
  attr_reader :winner
  attr_reader :has_movs

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @blocks = Array.new(9, ' ')
    @flag = true
    @winner = nil
    @has_movs = true

    @winner_positions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  end

  # Method collecting the names of the player
  def ask_names
    [@player1, @player2].each_with_index do |ply, index|
      system 'clear'
      puts 'Insert player' + (index + 1).to_s + "'s name"
      name = gets.chomp
      ply.name = name
    end
  end

  def mark
    player = @flag ? @player1 : @player2

    puts "#{player.name} please pick a number to set your \"#{player.symbol}\" mark: \n"
    move = gets.to_i - 1
    system 'clear'

    if @blocks[move] == ' '
      @blocks[move] = player.symbol
      player.mark_symbol(move)

      @winner = check_winner(player) ? player : nil
      @has_movs = !@winner && count_empties.positive? ? true : false

      @flag = !@flag
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
