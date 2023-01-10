class NoticeBoard < ApplicationRecord
  belongs_to :admin
  has_many :infos
end
