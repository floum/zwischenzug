class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :name, type: String
  field :language, type: String, default: 'en'

  validates_uniqueness_of :name
  validates :language, inclusion: { in: ['fr', 'en'] }
end
