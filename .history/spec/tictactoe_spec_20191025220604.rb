# frozen_string_literal: true

require 'io/console'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

describe 'board' do
  mplayer1 = Player.new('X')
  mplayer2 = Player.new('O')
  my_board = Board.new(mplayer1, mplayer2)

  it 'test 1' do
    my_board.reset

    my_board.mark(0)
    my_board.mark(2)
    my_board.mark(3)
    my_board.mark(4)
    my_board.mark(6)

    expect(my_board.winner).to be mplayer1
  end

  it 'test 2' do
    my_board.reset

    my_board.mark(8)
    my_board.mark(0)
    my_board.mark(3)
    my_board.mark(1)
    my_board.mark(4)
    my_board.mark(2)

    expect(my_board.winner).to be mplayer2
  end
end
