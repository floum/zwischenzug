class GameAnalysisController < ApplicationController
  def new
    @game_analysis = GameAnalysis.new(game_id: params[:game_id])
    @game = Game.find(params[:game_id])
    @game_analysis.color = (@game.result == '0-1' ? 'black' : 'white')

    @position = @game.positions(move: 2, color: @game_analysis.color)
  end
end
