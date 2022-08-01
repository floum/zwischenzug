class PositionAnalysis
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :game_analysis

  before_save :format_comments

  field :fen, type: String
  field :effective_move, type: String
  field :comments, type: String
  field :move, type: String

  def format_comments
    comments.gsub!("\r\n", "<br/>")
  end

  validates_presence_of :move
end
