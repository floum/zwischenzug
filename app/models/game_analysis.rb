class GameAnalysis
  include Mongoid::Document
  embeds_many :position_analysis
  belongs_to :game
  belongs_to :user
  field :archived, type: :boolean, default: false

  def archive
    self.archived = true
    save
  end

  def color
    game.review_color
  end

  def game_length
    game.length
  end

  def completion
    length.to_f / game.length
  end

  def length
    position_analysis.length
  end

  def ply_number
    position_analysis.size * 2  + (color == 'black' ? 1 : 0)
  end

  def moves
    game.moves.first(ply_number)
  end

  def complete?
    position_analysis.size == game.length
  end

  def current_fen
    game.fens[ply_number]
  end

  def effective_move
    game.moves[ply_number]
  end
end
