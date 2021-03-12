class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :first_name
    validates :last_name
  end       
  with_options presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end  
  validates :nickname, presence: true
  validates :birthday, presence: true 
    
end
