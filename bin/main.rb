#!/usr/bin/env ruby
# frozen_string_literal: true

class Main
end

class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @blocks = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @flag = true
  end

  # Method collecting the names of the player
  def getPlayerNames
    system 'clear'
    puts "Insert player1's name"
    name = gets.chomp
    @player1.setName(name)
    puts "Welcome #{@player1.getName}"
    system 'clear'
    puts "Insert player2's name"
    name = gets.chomp
    @player2.setName(name)
    puts "Welcome #{@player2.getName}" # .getName enables output to have the name of the player
  end

  # Printing of players names
  def printName
    puts @player1.getName
    puts @player2.getName
  end

  def setMark

    player = @flag ? @player1 : @player2

    @flag = !@flag

    puts "#{player.getName} please pick a number to set your \"#{player.getsymbol}\" mark: \n"
    move = gets.to_i - 1
    system 'clear'

    if @blocks[move] === ' '
      @blocks[move] = player.getsymbol
      player.setMove(move)
    else
      puts "that mark can't be done, because the block is not empty, try again..."
    end
  end

  def countEmpties
    @blocks.count {|i| i === ' '}
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
  def initialize(symbol)
    @move = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] # Positions on the board
    @symbol = symbol
    @status = false
  end

  # Marks the position of the user input
  def setMove(pos)
    @move[pos] = @symbol
  end

  # Sets the name of the player
  def setName(name)
    @name = name
  end

  def getsymbol
    @symbol
  end

  # Collects Name of the player
  def getName
    @name
  end
end

mplayer1 = Player.new('X')
mplayer2 = Player.new('O')
myBoard = Board.new(mplayer1, mplayer2)
myBoard.getPlayerNames
myBoard.draw

while myBoard.countEmpties > 0
  myBoard.setMark
  myBoard.draw
end

