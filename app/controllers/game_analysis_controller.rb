class GameAnalysisController < ApplicationController
  def new
    @game_analysis = GameAnalysis.new(game_id: params[:game_id])
    @game = @game_analysis.game
  end
end
