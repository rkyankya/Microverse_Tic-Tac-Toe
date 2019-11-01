# frozen_string_literal: true

require 'io/console'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe 'board' do
  mplayer1 = Player.new('X')
  mplayer2 = Player.new('O')
  my_board = Board.new(mplayer1, mplayer2)

  describe 'reset' do
    before(:each) do
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
    end

    it 'reset @block test' do
      my_board.reset
      expect(my_board.blocks).to eq(Array.new(9, ' '))
    end
    it 'reset @player1.move test' do
      my_board.reset
      expect(mplayer1.move).to eq(Array.new(9, ' '))
    end
    it 'reset @player2.move test' do
      my_board.reset
      expect(mplayer2.move).to eq(Array.new(9, ' '))
    end
    it 'reset @player_turn test' do
      my_board.reset
      expect(my_board.player_turn).to be mplayer1
    end
    it 'reset @winner test' do
      my_board.reset
      expect(my_board.winner).to be nil
    end
    it 'reset @has_movs test' do
      my_board.reset
      expect(my_board.has_movs).to be true
    end
  end

  describe 'mark' do
    before(:all) do
      my_board.reset
    end

    it 'test move to block 4 for player 1 to set its symbol' do
      my_board.mark(3)
      expect(my_board.blocks[3]).to be mplayer1.symbol
    end
    it 'test move to block 3 for player 2 to set its symbol' do
      my_board.mark(2)
      expect(my_board.blocks[2]).to be mplayer2.symbol
    end
    it 'test move to block 1 for player 1 to set its symbol' do
      my_board.mark(0)
      expect(my_board.blocks[0]).to be mplayer1.symbol
    end
    it 'test move to block 7 for player 2 to set its symbol' do
      my_board.mark(6)
      expect(my_board.blocks[6]).to be mplayer2.symbol
    end
    it 'test move to block 5 for player 1 to set its symbol' do
      my_board.mark(4)
      expect(my_board.blocks[4]).to be mplayer1.symbol
    end
    it 'test move to block 6 for player 2 to set its symbol' do
      my_board.mark(5)
      expect(my_board.blocks[5]).to be mplayer2.symbol
    end
    it 'test move to block 8 for player 1 to set its symbol' do
      my_board.mark(7)
      expect(my_board.blocks[7]).to be mplayer1.symbol
    end
    it 'test move to block 2 for player 2 to set its symbol' do
      my_board.mark(1)
      expect(my_board.blocks[1]).to be mplayer2.symbol
    end
    it 'test move to block 9 for player 1 to set its symbol' do
      my_board.mark(8)
      expect(my_board.blocks[8]).to be mplayer1.symbol
    end
  end

  describe 'check_winner' do
    before(:each) do
      my_board.reset
    end

    it 'testing 1st row for player1' do
      my_board.mark(0)
      my_board.mark(5)
      my_board.mark(1)
      my_board.mark(4)
      my_board.mark(2)
      expect(my_board.winner).to be mplayer1
    end

    it 'testing 2nd row for player1' do
      my_board.mark(3)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(5)
      expect(my_board.winner).to be mplayer1
    end

    it 'testing 3th row for player1' do
      my_board.mark(6)
      my_board.mark(0)
      my_board.mark(7)
      my_board.mark(1)
      my_board.mark(8)
      expect(my_board.winner).to be mplayer1
    end

    it 'testing 1st col for player1' do
      my_board.mark(0)
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(1)
      my_board.mark(6)
      expect(my_board.winner).to be mplayer1
    end

    it 'testing 2nd col for player1' do
      my_board.mark(1)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(2)
      my_board.mark(7)
      expect(my_board.winner).to be mplayer1
    end

    it 'testing 3rd col for player1' do
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(5)
      my_board.mark(1)
      my_board.mark(8)
      expect(my_board.winner).to be mplayer1
    end

    it 'testing diagonal 1 for player1' do
      my_board.mark(0)
      my_board.mark(2)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(8)
      expect(my_board.winner).to be mplayer1
    end

    it 'testing diagonal 2 for player1' do
      my_board.mark(2)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(6)
      expect(my_board.winner).to be mplayer1
    end

    it 'testing 1st row for player2' do
      my_board.mark(6)
      my_board.mark(0)
      my_board.mark(5)
      my_board.mark(1)
      my_board.mark(4)
      my_board.mark(2)
      expect(my_board.winner).to be mplayer2
    end

    it 'testing 2nd row for player2' do
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(5)
      expect(my_board.winner).to be mplayer2
    end

    it 'testing 3th row for player2' do
      my_board.mark(2)
      my_board.mark(6)
      my_board.mark(0)
      my_board.mark(7)
      my_board.mark(1)
      my_board.mark(8)
      expect(my_board.winner).to be mplayer2
    end

    it 'testing 1st col for player2' do
      my_board.mark(4)
      my_board.mark(0)
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(1)
      my_board.mark(6)
      expect(my_board.winner).to be mplayer2
    end

    it 'testing 2nd col for player2' do
      my_board.mark(3)
      my_board.mark(1)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(2)
      my_board.mark(7)
      expect(my_board.winner).to be mplayer2
    end

    it 'testing 3rd col for player2' do
      my_board.mark(4)
      my_board.mark(2)
      my_board.mark(3)
      my_board.mark(5)
      my_board.mark(1)
      my_board.mark(8)
      expect(my_board.winner).to be mplayer2
    end

    it 'testing diagonal 1 for player2' do
      my_board.mark(3)
      my_board.mark(0)
      my_board.mark(2)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(8)
      expect(my_board.winner).to be mplayer2
    end

    it 'testing diagonal 2 for player2' do
      my_board.mark(3)
      my_board.mark(2)
      my_board.mark(0)
      my_board.mark(4)
      my_board.mark(1)
      my_board.mark(6)
      expect(my_board.winner).to be mplayer2
    end

    it 'testing full boarnd and winner player1' do
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

  describe 'count_empties' do
    before(:all) do
      my_board.reset
    end

    it 'count_empties after mark 1 block' do
      my_board.mark(0)
      expect(my_board.count_empties).to eq(8)
    end
    it 'count_empties after mark 2 blocks' do
      my_board.mark(1)
      expect(my_board.count_empties).to eq(7)
    end
    it 'count_empties after mark 3 blocks' do
      my_board.mark(2)
      expect(my_board.count_empties).to eq(6)
    end
    it 'count_empties after mark 4 blocks' do
      my_board.mark(3)
      expect(my_board.count_empties).to eq(5)
    end
    it 'count_empties after mark 5 blocks' do
      my_board.mark(4)
      expect(my_board.count_empties).to eq(4)
    end
    it 'count_empties after mark 6 blocks' do
      my_board.mark(6)
      expect(my_board.count_empties).to eq(3)
    end
    it 'count_empties after mark 7 blocks' do
      my_board.mark(5)
      expect(my_board.count_empties).to eq(2)
    end
    it 'count_empties after mark 8 blocks' do
      my_board.mark(8)
      expect(my_board.count_empties).to eq(1)
    end
    it 'count_empties after mark 9 blocks' do
      my_board.mark(7)
      expect(my_board.count_empties).to eq(0)
    end
  end
end
