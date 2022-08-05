module UsersHelper
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
  def localize language, move
    TRANSLATIONS[language].reduce(move) do |res, (key, value)|
      res.gsub(key, value)
    end
  end

  def unlocalize language, move
    TRANSLATIONS[language].reduce(move) do |res, (key, value)|
      res.gsub(value, key)
    end
  end
end
