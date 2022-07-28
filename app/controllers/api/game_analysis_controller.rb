class Api::GameAnalysisController < Api::ApplicationController
  def import
    @user = User.find_by(name: params[:user])
    games = params[:games]
    games.each do |game|
      pgn = Lichess.fetch(game["url"][-8..-1])
      @game = Game.find_by(pgn: pgn)
      unless @game
        @game = Game.create(
          pgn: pgn,
          review_color: game["review_color"]
        )
      end
      GameAnalysis.create(game: @game, user: @user)
    end
  end
end
