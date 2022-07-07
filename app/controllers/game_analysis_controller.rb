class GameAnalysisController < ApplicationController
  before_action :require_login

  def show
    begin
      @game_analysis = GameAnalysis.find_by(
        game_id: params[:game_id],
        user_id: current_user.id
      )
    rescue Mongoid::Errors::DocumentNotFound
      @game_analysis = GameAnalysis.create(
        game_id: params[:game_id],
        user: current_user
      )
    end
    @position_analysis = PositionAnalysis.new

    if @game_analysis.complete?
      flash[:notice] = 'Analysis Complete'
      redirect_to games_path
    end
  end

  def update
    @game_analysis = GameAnalysis.find_by(
      game_id: params[:game_id],
      user_id: current_user.id
    )
    @position_analysis = PositionAnalysis.new(position_analysis_params)

    @game_analysis.position_analysis << @position_analysis

    @game_analysis.save

    @position_analysis = PositionAnalysis.new

    redirect_to game_analysis_path(game_id: params[:game_id])
  end

  private

  def position_analysis_params
    params.require(:position_analysis).permit(:comments, :move)
  end

end
