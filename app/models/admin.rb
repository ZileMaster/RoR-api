class Admin < ApplicationRecord
    has_one :notice_boards
    has_one :personal_blogs
    has_one :travel_blogs
    has_one :project_pages
    has_many :users

    has_secure_password
        
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }
end
