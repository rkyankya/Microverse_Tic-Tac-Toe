# frozen_string_literal: true

require 'io/console'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe 'board' do
  describe 'reset' do
    mplayer1 = Player.new('X')
    mplayer2 = Player.new('O')
    my_board = Board.new(mplayer1, mplayer2)
    my_board.reset
    my_board.mark(3)
    my_board.mark(2)
    my_board.mark(0)
    my_board.mark(6)
    my_board.mark(4)
    my_board.mark(5)
    my_board.mark(7)
    my_board.mark(1)
    my_board.mark(8)

    it 'reset @block test' do
      my_board.reset
      expect(my_board.blocks == Array.new(9, ' '))
    end
    it 'reset @player1.move test' do
      my_board.reset
      expect(mplayer1.move == Array.new(9, ' '))
    end
    it 'reset @player2.move test' do
      my_board.reset
      expect(mplayer2.move == Array.new(9, ' '))
    end
    it 'reset @player_turn test' do
      my_board.reset
      expect(my_board.player_turn == mplayer1)
    end
    it 'reset @winner test' do
      my_board.reset
      expect(my_board.winner.nil?)
    end
    it 'reset @has_movs test' do
      my_board.reset
      expect(my_board.has_movs == true)
    end
  end

  describe 'check_winner' do
    mplayer1 = Player.new('X')
    mplayer2 = Player.new('O')
    my_board = Board.new(mplayer1, mplayer2)

    it 'testing 1st row for player1' do
      my_board.reset

      my_board.mark(0)
      my_board.mark(5)
      my_board.mark(1)
      my_board.mark(4)
      my_board.mark(2)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing 2nd row for player1' do
      my_board.reset

      my_board.mark(3)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(5)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing 3th row for player1' do
      my_board.reset

      my_board.mark(6)
      my_board.mark(0)
      my_board.mark(7)
      my_board.mark(1)
      my_board.mark(8)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing 1st col for player1' do
      my_board.reset

      my_board.mark(0)
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(1)
      my_board.mark(6)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing 2nd col for player1' do
      my_board.reset

      my_board.mark(1)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(2)
      my_board.mark(7)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing 3rd col for player1' do
      my_board.reset

      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(5)
      my_board.mark(1)
      my_board.mark(8)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing diagonal 1 for player1' do
      my_board.reset

      my_board.mark(0)
      my_board.mark(2)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(8)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing diagonal 2 for player1' do
      my_board.reset

      my_board.mark(2)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(6)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing 1st row for player2' do
      my_board.reset

      my_board.mark(6)
      my_board.mark(0)
      my_board.mark(5)
      my_board.mark(1)
      my_board.mark(4)
      my_board.mark(2)

      expect(my_board.winner).to be mplayer2
    end

    it 'testing 2nd row for player2' do
      my_board.reset

      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(5)

      expect(my_board.winner).to be mplayer2
    end

    it 'testing 3th row for player2' do
      my_board.reset

      my_board.mark(2)
      my_board.mark(6)
      my_board.mark(0)
      my_board.mark(7)
      my_board.mark(1)
      my_board.mark(8)

      expect(my_board.winner).to be mplayer2
    end

    it 'testing 1st col for player2' do
      my_board.reset

      my_board.mark(4)
      my_board.mark(0)
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(1)
      my_board.mark(6)

      expect(my_board.winner).to be mplayer2
    end

    it 'testing 2nd col for player2' do
      my_board.reset

      my_board.mark(3)
      my_board.mark(1)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(2)
      my_board.mark(7)

      expect(my_board.winner).to be mplayer2
    end

    it 'testing 3rd col for player2' do
      my_board.reset

      my_board.mark(4)
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(5)
      my_board.mark(1)
      my_board.mark(8)

      expect(my_board.winner).to be mplayer2
    end

    it 'testing diagonal 1 for player2' do
      my_board.reset

      my_board.mark(3)
      my_board.mark(0)
      my_board.mark(2)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(8)

      expect(my_board.winner).to be mplayer2
    end

    it 'testing diagonal 2 for player2' do
      my_board.reset

      my_board.mark(3)
      my_board.mark(2)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(6)

      expect(my_board.winner).to be mplayer2
    end

    it 'testing full boarnd and winner player1' do
      my_board.reset

      my_board.mark(3)
      my_board.mark(2)
      my_board.mark(0)
      my_board.mark(6)
      my_board.mark(4)
      my_board.mark(5)
      my_board.mark(7)
      my_board.mark(1)
      my_board.mark(8)

      expect(my_board.winner).to be mplayer1
    end

    it 'testing draw' do
      my_board.reset

      my_board.mark(0)
      my_board.mark(1)
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(4)
      my_board.mark(6)
      my_board.mark(5)
      my_board.mark(8)
      my_board.mark(7)

      expect(my_board.winner).to be nil
    end
  end
end
