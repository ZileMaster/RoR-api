class User < ApplicationRecord
  belongs_to :admin
  has_many :komentars
  has_one :newsletters
end
