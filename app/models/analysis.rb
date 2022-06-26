class Analysis
  include Mongoid::Document
  include Mongoid::Timestamps
  field :evaluation, type: String
  field :observations, type: String
  field :candidate_moves, type: String
  field :move, type: String
  belongs_to :position

  validates_presence_of :evaluation
  validates_presence_of :move
  validates_presence_of :candidate_moves
end
