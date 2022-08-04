class MoveTranslator
  TRANSLATIONS = {
    'en' => {
      'K' => 'K',
      'Q' => 'Q',
      'R' => 'R',
      'N' => 'N',
      'B' => 'B'
    },
    'fr' => {
      'K' => 'R',
      'Q' => 'D',
      'R' => 'T',
      'N' => 'C',
      'B' => 'F'
    }
  }

  def initialize(language)
    @language = language
  end

  def to(move)
    TRANSLATIONS[@language].reduce(move) do |res, (key, value)|
      res.gsub(key, value)
    end
  end

  def from(move)
    p move
    TRANSLATIONS[@language].reduce(move) do |res, (key, value)|
      res.gsub(value, key)
    end
  end
end
