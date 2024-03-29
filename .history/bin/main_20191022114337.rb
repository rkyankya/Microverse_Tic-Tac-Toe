#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'

class Game
  def initialize(board)
    @game_board = board

    @game_board.ask_names
    @game_board.draw
  end

  def start
    while @game_board.count_empties.positive? && !@game_board.winner
      @game_board.mark
      @game_board.draw
    end

    if @game_board.winner
      puts "#{@game_board.winner.name} wins!!"
    else
      puts 'This is a draw'
    end
  end
end

class Board
  attr_reader :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @blocks = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @flag = true

    @winner_patterns = [
      [1, 1, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 1, 1, 1],
      [1, 0, 0, 1, 0, 0, 1, 0, 0],
      [0, 1, 0, 0, 1, 0, 0, 1, 0],
      [0, 0, 1, 0, 0, 1, 0, 0, 1],
      [1, 0, 0, 0, 1, 0, 0, 0, 1],
      [0, 0, 1, 0, 1, 0, 1, 0, 0]
    ]

    @winner = nil
  end

  # Method collecting the names of the player
  def ask_names
    system 'clear'
    puts "Insert player1's name"
    name = gets.chomp
    @player1.name = name

    system 'clear'
    puts "Insert player2's name"
    name = gets.chomp
    @player2.name = name
  end

  def mark
    player = @flag ? @player1 : @player2

    puts "#{player.name} please pick a number to set your \"#{player.getsymbol}\" mark: \n"
    move = gets.to_i - 1
    system 'clear'

    if @blocks[move] == ' '
      @blocks[move] = player.getsymbol
      player.mark_symbol(move)

      puts player.move.to_s
      @winner = check_winner(player) ? player : nil

      @flag = !@flag
    else
      key_tocontinue 'that mark can\'t be done, because the block is not empty, try again...'
    end
  end

  def check_winner(player)
    arr = player.move.map { |i| i != ' ' ? 1 : 0 }

    @winner_patterns.any? do |i|
      r = i.each_with_index.inject(0) do |acc, (val, index)|
        val == arr[index] && val == 1 ? acc + 1 : acc
      end
      r == 3
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

class Player
  attr_reader :name
  attr_writer :name

  attr_reader :move
  attr_writer :move

  def initialize(symbol)
    @move = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] # Positions on the board
    @symbol = symbol
    @status = false
  end

  # Marks the position of the user input
  def mark_symbol(pos)
    @move[pos] = @symbol
  end

  def getsymbol
    @symbol
  end
end

mplayer1 = Player.new('X')
mplayer2 = Player.new('O')
my_board = Board.new(mplayer1, mplayer2)

my_game = Game.new(my_board)
my_game.start
