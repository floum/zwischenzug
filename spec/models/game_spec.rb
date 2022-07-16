require 'rails_helper'

RSpec.describe Game do
  subject do
    Game.create(pgn: '1.e4')
  end
  it 'includes the starting fen' do
    expect(subject.fens).to include(Game::STARTING_FEN)
  end
end
