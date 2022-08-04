class PositionAnalysis
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :game_analysis

  before_save :format_comments
  before_validation :reject_illegal_move

  field :fen, type: String
  field :effective_move, type: String
  field :comments, type: String
  field :move, type: String

  def format_comments
    comments.gsub!("\r\n", "<br/>")
  end

  def reject_illegal_move
    game = Chess::Game.load_fen(fen)
    begin
      game.move(move)
    rescue Chess::BadNotationError, Chess::IllegalMoveError
      errors.add(:move, 'Move cannot be played')
    end
  end

  validates_presence_of :move
end
