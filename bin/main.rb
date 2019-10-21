#!/usr/bin/env ruby
# frozen_string_literal: true

class Board

  @player1
  @player2

  @blocks = [0,0,0,0,0,0,0,0,0]

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def getPlayerNames
    puts "Insert player1's name"
    name = gets.chomp
    @player1.setName(name)
    puts "Welcome #{@player1.getName}"

    puts "Insert player2's name"
    name = gets.chomp
    @player2.setName(name)
    puts "Welcome #{@player2.getName}"
  end

  def printName
    puts @player1.getName
    puts @player2.getName
  end

  def draw
    mv = @player1.getMove
    printf(" %s | %s | %s \n", mv[0], mv[1], mv[2])
    puts '-----------'
    printf(" %s | %s | %s \n", mv[3], mv[4], mv[5])
    puts '-----------'
    printf(" %s | %s | %s \n", mv[6], mv[7], mv[8])

    mv = @player2.getMove
    printf(" %s | %s | %s \n", mv[0], mv[1], mv[2])
    puts '-----------'
    printf(" %s | %s | %s \n", mv[3], mv[4], mv[5])
    puts '-----------'
    printf(" %s | %s | %s \n", mv[6], mv[7], mv[8])
  end
end

class Player
  @name
  @move
  @symbol

  def initialize(symbol)
    @move = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @symbol = symbol
  end

  def setMove
    puts "Select a number 1 to 9 to set a position"
    puts ' 1 | 2 | 3 '
    puts '-----------'
    puts ' 4 | 5 | 6 '
    puts '-----------'
    puts ' 7 | 8 | 9 '

    move = gets.to_i - 1
    @move[move] = @symbol

    puts @move.to_s

  end

  def getMove
    @move
  end

  def setName(name)
    @name = name
  end

  def getName
    @name
  end
end

mplayer1 = Player.new("X")
mplayer2 = Player.new("O")
myBoard = Board.new(mplayer1, mplayer2)
myBoard.getPlayerNames
mplayer1.setMove
myBoard.draw
mplayer2.setMove
myBoard.draw