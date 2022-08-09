module UsersHelper
  TRANSLATIONS = {
    'en' => 'KQRNB',
    'fr' => 'RDTCF'
  }
  def localize language, move
    move.tr(TRANSLATIONS['en'], TRANSLATIONS[language])
  end

  def unlocalize language, move
    move.tr(TRANSLATIONS[language], TRANSLATIONS['en'])
  end
end
