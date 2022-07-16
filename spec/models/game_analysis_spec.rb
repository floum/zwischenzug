require 'rails_helper'

RSpec.describe GameAnalysis do
  context 'when game review color is white' do
    it 'starts at starting fen' do
      game = Game.create(review_color: 'white', pgn: '1.e4 e5 2.Qh5 g6 3.Qxe5+ 1-0')
      game_analysis = GameAnalysis.new(game: game)

      expect(game_analysis.current_fen).to eq(Game::STARTING_FEN)
    end
  end

  context 'when game review color is black' do
    it 'starts at first black move' do
      game = Game.create(review_color: 'black', pgn: '1.e4 e5')
      game_analysis = GameAnalysis.new(game: game)

      expect(game_analysis.current_fen).to eq('rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1')
    end
  end
end
