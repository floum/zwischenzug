class Analysis
  include Mongoid::Document
  include Mongoid::Timestamps

  field :fen, type: String
  field :evaluation, type: String
  field :observations, type: String
  field :candidate_moves, type: String
  field :move, type: String
  belongs_to :position
  belongs_to :user

  validates_presence_of :evaluation
  validates_presence_of :move
  validates_presence_of :candidate_moves

  def author
    user
  end

  def color
    fen.split(' ')[1] == 'w' ? 'white' : 'black'
  end
end
