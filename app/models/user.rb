class User < ApplicationRecord
  belongs_to :admin
  has_many :komentars
  has_one :newsletters

  has_secure_password

  validate :validations_user
        
  def validations_user
      if new_record?
          errors.add(:email, "can't be blank") if email.blank?
          errors.add(:email, "already taken") if Admin.where(email: email).where.not(id: id).exists?
          errors.add(:email, "is invalid") unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
          errors.add(:username, "can't be blank") if username.blank?
          errors.add(:username, "already taken") if Admin.where(username: username).where.not(id: id).exists?
          errors.add(:first_name, "can't be blank") if first_name.blank?
          errors.add(:first_name, "must start with a letter") unless first_name =~ /\A[a-zA-Z]/
          errors.add(:first_name, "must have at least 3 letters") unless first_name.length >= 3
          errors.add(:last_name, "can't be blank") if last_name.blank?
          errors.add(:password, "can't be blank") if password.blank?
          
      else
          errors.add(:username, "can't be blank") if username.blank?
          errors.add(:password, "can't be blank") if password.blank?
      end
  end
end
