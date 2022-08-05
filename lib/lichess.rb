class Lichess
  def self.fetch(id)
    id = id.split('/').last[0..7]
    response = Net::HTTP.get(URI.parse("https://lichess.org/game/export/#{id}?evals=false&clocks=false")).force_encoding('UTF-8')
    response
  end
end
