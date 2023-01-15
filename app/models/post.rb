class Post < ApplicationRecord
  belongs_to :personal_blog
  belongs_to :travel_blog
  belongs_to :project_page
  has_many :komentars

  validate :validations_post
        
  def validations_post
      if new_record?
          errors.add(:headline, "can't be blank") if headline.blank?
          errors.add(:description, "can't be blank") if description.blank?
          errors.add(:headline, "must have at least 10 letters") unless headline.length >= 10
          errors.add(:description, "must have at least 25 characters") unless description.length >= 25  
      else
          errors.add(:headline, "can't be blank") if description.blank?
          errors.add(:description, "can't be blank") if description.blank?
      end
    end
end
