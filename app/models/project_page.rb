class ProjectPage < ApplicationRecord
  belongs_to :admin
  has_many :posts
end
