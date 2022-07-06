class GameAnalysisController < ApplicationController
  before_action :require_login

  def create
    @game_analysis = GameAnalysis.create(
      game_id: params[:game_id],
      user: current_user
    )
    redirect_to game_analysis_path(@game_analysis)
  end

  def show
    @game_analysis = GameAnalysis.find(params[:id])
    @position_analysis = PositionAnalysis.new
  end

  def update

  end
end
