class Info < ApplicationRecord
  belongs_to :notice_board

  validate :validations_info
        
  def validations_info
      if new_record?
          errors.add(:head, "can't be blank") if headline.blank?
          errors.add(:description, "can't be blank") if description.blank?
          errors.add(:head, "must have at least 10 letters") unless headline.length >= 10
          errors.add(:description, "must have at least 25 characters") unless description.length >= 25     
      else
          errors.add(:head, "can't be blank") if description.blank?
          errors.add(:description, "can't be blank") if description.blank?
      end
    end
end
