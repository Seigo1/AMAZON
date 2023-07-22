class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 2,maximum: 10 }
  validates :email, presence: true, uniqueness: true

  attachment :image

  enum is_active: { 有効: true, 無効: false }

  # 有効のユーザーしかログインできなくする
  def active_for_authentication?
    super && (self.is_active == "有効")
  end
end