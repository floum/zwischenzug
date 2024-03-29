class GamesController < ApplicationController
  def index
    @games = Game.active
  end

  def import
    @game = Game.new(pgn: Lichess.fetch(params[:lichess_id]), review_color: params[:review_color], lichess_id: params[:lichess_id])
    if @game.save
      flash[:notice] = 'Game saved'
      redirect_to game_path(@game)
    else
      flash[:alert] = "Game was not saved : #{@game.errors.full_messages}"
      redirect_to games_path
    end

  end

  def destroy
    @game = Game.find(params[:id])
    @game.archive

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

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:pgn, :review_color, :lichess_id)
  end
end
