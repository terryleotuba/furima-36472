class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は不正な値です。英字と数字の両方を含めて設定してください' }

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は不正な値です。全角を入力してください' }
    validates :given_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は不正な値です。全角を入力してください' }
    validates :family_name_reading, format: { with: /\A[ァ-ヶー]+\z/, message: 'は不正な値です。全角のカタカナを入力してください' }
    validates :given_name_reading, format: { with: /\A[ァ-ヶー]+\z/, message: 'は不正な値です。全角のカタカナを入力してください' }
    validates :birthday
  end

  has_many :items
  has_many :orders
end
