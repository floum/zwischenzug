class GameAnalysis
  include Mongoid::Document
  field :analysis, type: Array
  belongs_to :game
  belongs_to :user

  def color
    game.review_color
  end
end
