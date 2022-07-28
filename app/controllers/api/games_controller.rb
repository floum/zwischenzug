class Api::GamesController < Api::ApplicationController
  def import
    games = params[:games]
    games.each do |game|
      p game
    end
  end
end
