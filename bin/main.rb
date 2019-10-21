#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
end

class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @blocks = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @flag = true
  end

  # Method collecting the names of the player
  def ask_names
    system 'clear'
    puts "Insert player1's name"
    name = gets.chomp
    @player1.name = name
    puts "Welcome #{@player1.name}"
    system 'clear'
    puts "Insert player2's name"
    name = gets.chomp
    @player2.name = name
    puts "Welcome #{@player2.name}" # .name enables output to have the name of the player
  end

  def mark
    player = @flag ? @player1 : @player2

    @flag = !@flag

    puts "#{player.name} please pick a number to set your \"#{player.getsymbol}\" mark: \n"
    move = gets.to_i - 1
    system 'clear'

    if @blocks[move] == ' '
      @blocks[move] = player.getsymbol
      player.move(move)
    else
      puts "that mark can't be done, because the block is not empty, try again..."
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

  def compare
    (0..@blocks.legth).each do |i|
    end
  end
end

class Player
  attr_reader :name
  attr_writer :name

  def initialize(symbol)
    @move = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] # Positions on the board
    @symbol = symbol
    @status = false
  end

  # Marks the position of the user input
  def move(pos)
    @move[pos] = @symbol
  end

  def getsymbol
    @symbol
  end
end

mplayer1 = Player.new('X')
mplayer2 = Player.new('O')
my_board = Board.new(mplayer1, mplayer2)
my_board.ask_names
my_board.draw

while my_board.count_empties.positive?
  my_board.mark
  my_board.draw
end
