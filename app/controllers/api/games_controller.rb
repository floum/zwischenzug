class Api::GamesController < Api::ApplicationController
  def import
    games = params[:games]
    games.each do |game|
      pgn = Lichess.fetch(game["url"][-8..-1])
      @game = Game.create(
        pgn: pgn,
        review_color: game["review_color"]
      )
      p @game.errors.full_messages
    end
  end
end
