class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  field :pgn, type: String
  field :white, type: String
  field :black, type: String
  field :result, type: String
  field :moves, type: Array
  field :review_color, type: String
  field :fens, type: Array

  has_many :game_analysis, dependent: :destroy

  validate :valid_pgn

  before_create :parse_pgn

  STARTING_FEN = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'

  def length
    moves.size / 2
  end

  def valid_pgn
    begin
     _pgn = Chess::Pgn.new
     logger.debug(pgn)
     _pgn.load_from_string(pgn, check_moves: true)
   rescue Chess::InvalidPgnFormatError => e
      errors.add(:pgn, e.message)
    end
  end

  def parse_pgn
     _pgn = Chess::Pgn.new
     _pgn.load_from_string(pgn, check_moves: true)
     self.white = _pgn.white
     self.black = _pgn.black
     self.result = _pgn.result
     self.moves = _pgn.moves

     _game = Chess::Game.new
     self.fens = [_game.board.to_fen]
     _pgn.moves.each do |move|
        _game.move(move)
        self.fens << _game.board.to_fen
     end
  end

  def current_analysis(user)
    game_analysis.select { |analysis| analysis.user == user && !analysis.complete? }
  end

  def header
    "#{white} - #{black} | #{result}"
  end
end
