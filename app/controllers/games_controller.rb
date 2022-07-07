class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def import
    response = Net::HTTP.get(URI.parse("https://lichess.org/game/export/#{params[:lichess_id]}?evals=false"))
    @game = Game.new(pgn: response)
    if @game.save
      flash[:notice] = 'Game saved'
    else
      flash[:alert] = "Game was not saved : #{@game.errors.full_messages}"
    end

    redirect_to games_path
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = 'Game saved'
    else
      flash[:alert] = 'Game was not saved'
    end

    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:pgn, :review_color)
  end
end
