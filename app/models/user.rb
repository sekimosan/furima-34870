class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end       
  validates :last_name_kana, presence: true, format: {with: /\A[\p{katakana}\u{30fc}]+\z/}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\u{30fc}]+\z/}
  validates :nickname, presence: true
  validates :birthday, presence: true       
end
