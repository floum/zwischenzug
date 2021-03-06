class Position
  include Mongoid::Document
  include Mongoid::Timestamps

  EVALUATIONS = %w(+- +/- +/= = -/= -/+ -+)

  has_many :analysis

  field :fen, type: String

  validates_presence_of :fen
  validates_uniqueness_of :fen

  def on_move
    fen.split(' ')[1] == 'w' ? 'white' : 'black'
  end
end
