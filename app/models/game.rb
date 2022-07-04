class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  field :pgn, type: String
  field :white, type: String
  field :black, type: String
  field :result, type: String
  
  before_create :parse_headers

  def parse_headers
    game = PGN.parse(pgn).first
    self.white = game.tags['White']
    self.black = game.tags['Black']
    self.result = game.tags['Result']
  end
end
