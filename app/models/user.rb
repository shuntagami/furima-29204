class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birth_date, presence: true
          
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true, format: { with: /[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
    validates :lastname
    validates :firstname
  end

  with_options presence: true, format: { with: /[ァ-ン]/, message: 'Full-width katakana characters' } do
    validates :lastname_kana
    validates :firstname_kana
  end

end
