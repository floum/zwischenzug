class AnalysisController < ApplicationController
  def create
    @position = Position.find(params[:position_id])
    @analysis = Analysis.new(position: @position)

    @analysis.evaluation = params[:evaluation]

    if @analysis.save
      flash.notice = 'analysis saved'
    else
      flash.alert = "could not save analysis, #{@analysis.errors.inspect}"
    end
    redirect_to position_path(@position)
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

end
