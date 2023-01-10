class Post < ApplicationRecord
  belongs_to :personal_blog
  belongs_to :travel_blog
  belongs_to :project_page
  has_many :komentars
end
