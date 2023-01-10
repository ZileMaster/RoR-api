class User < ApplicationRecord
  belongs_to :admin
  has_many :komentars
  has_one :newsletters

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
