class User < ApplicationRecord
  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birth_date, presence: true
          
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  NAME_REGEX = /[ぁ-んァ-ン一-龥]/.freeze
  with_options presence: true, format: { with: NAME_REGEX, message: 'Full-width characters' } do
    validates :lastname
    validates :firstname
  end

  NAME_KANA_REGEX = /[ァ-ン]/.freeze
  with_options presence: true, format: { with: NAME_KANA_REGEX, message: 'Full-width katakana characters' } do
    validates :lastname_kana
    validates :firstname_kana
  end
end
