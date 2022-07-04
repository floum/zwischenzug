class GameAnalysis
  include Mongoid::Document
  field :analysis, type: Array
  field :color, type: String
  belongs_to :game
  belongs_to :user
end
