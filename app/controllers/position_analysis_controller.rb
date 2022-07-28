class PositionAnalysisController < ApplicationController
  def create
    @game_analysis = GameAnalysis.find(params[:game_analysis_id])
    @position_analysis = PositionAnalysis.new(position_analysis_params)

    @game_analysis.position_analysis << @position_analysis

    @game_analysis.save

    redirect_to edit_game_analysis_path(@game_analysis)
  end

  private

  def position_analysis_params
    params.require(:position_analysis).permit(:comments)
  end
end
