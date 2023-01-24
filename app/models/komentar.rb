class Komentar < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validate :validations_com 

  def validations_com
      errors.add(:headline, "can't be blank") if headline.blank?
      errors.add(:description, "can't be blank") if description.blank?
      errors.add(:headline, "must have at least 10 letters") unless headline.length >= 10
      errors.add(:description, "must have at least 25 characters") unless description.length >= 25
  end
end
