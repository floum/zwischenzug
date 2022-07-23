class GameAnalysisController < ApplicationController
  before_action :require_login

  def new
    @game_analysis = GameAnalysis.new
  end

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

    p @game_analysis.to_json
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
    @game_analysis = GameAnalysis.new(game_analysis_params)
    @game_analysis.user = current_user
    if @game_analysis.save
      flash[:notice] = 'Good luck!'
      redirect_to game_analysis_path(@game_analysis.id)
    end
  end

  private

  def game_analysis_params
    params.require(:game_analysis).permit(:game_id)
  end

  def position_analysis_params
    params.require(:position_analysis).permit(:comments, :move, :fen, :effective_move)
  end

end
