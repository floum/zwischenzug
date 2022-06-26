class AnalysisController < ApplicationController
  def create
    @position = Position.find(params[:position_id])
    @analysis = Analysis.new(analysis_params)
    @analysis.position = @position

    if @analysis.save
      flash.notice = 'analysis saved'
    else
      flash.alert = "could not save analysis, #{@analysis.errors.full_messages}"
    end
    redirect_to position_path(@position)
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  def destroy
    @analysis = Analysis.find(params[:id])
    @position = @analysis.position

    @analysis.destroy

    redirect_to position_path(@position)
  end

  private

  def analysis_params
    params.require(:analysis).permit(:evaluation, :move, :candidate_moves)
  end

end
