class PositionAnalysis
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :game_analysis

  field :fen, type: String
  field :effective_move, type: String
  field :comments, type: String
  field :move, type: String

  validates_presence_of :move
end
