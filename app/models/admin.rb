class Admin < ApplicationRecord
    has_one :notice_boards
    has_one :personal_blogs
    has_one :travel_blogs
    has_one :project_pages
    has_many :users
end
