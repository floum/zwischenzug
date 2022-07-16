class GameAnalysisController < ApplicationController
  before_action :require_login

  def index
    @game_analysis = GameAnalysis.where(user: current_user)
  end

  def edit
    @game_analysis = GameAnalysis.find(params[:id])
    @position_analysis = PositionAnalysis.new
  end

  def show
    @game_analysis = GameAnalysis.find(params[:id])
    @position_analysis = PositionAnalysis.new

    unless @game_analysis.complete?
      render 'edit'
    end
  end

  def update
    @game_analysis = GameAnalysis.find(params[:id])
    @position_analysis = PositionAnalysis.new(position_analysis_params)

    @game_analysis.position_analysis << @position_analysis
    @game_analysis.save

    redirect_to game_analysis_path(params[:id])
  end

  def create
    raise StandardError
  end

  private

  def position_analysis_params
    params.require(:position_analysis).permit(:comments, :move)
  end

end
