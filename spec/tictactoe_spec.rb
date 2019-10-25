# frozen_string_literal: true

require 'io/console'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe 'board' do
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
