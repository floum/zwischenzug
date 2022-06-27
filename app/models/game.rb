class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  field :pgn, type: String
end
