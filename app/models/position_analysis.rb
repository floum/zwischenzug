class PositionAnalysis
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :game_analysis

  field :comments, type: String
  field :move, type: String
end
