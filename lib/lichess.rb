class Lichess
  def self.fetch(id)
    Net::HTTP.get(URI.parse("https://lichess.org/game/export/#{id}?evals=false&clocks=false"))
  end
end
