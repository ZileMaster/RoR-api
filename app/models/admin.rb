class Admin < ApplicationRecord
    has_one :notice_boards
    has_one :personal_blogs
    has_one :travel_blogs
    has_one :project_pages
    has_many :users

    has_secure_password
        
    # validates :email, presence: true, uniqueness: true
    # validates :username, presence: true, uniqueness: true
    # validates :first_name, presence: true
    # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    # # validates :password, presence: true, length: { minimum: 8 }
    # # validates

    validate :validations_admin
        
    def validations_admin
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
            errors.add(:password, "can't be blank") if password_digest.blank?
            errors.add(:password, "must have at least 8 characters") unless password_digest.length >= 8
            
        else
            errors.add(:username, "can't be blank") if username.blank?
            errors.add(:password, "can't be blank") if password.blank?
        end
    end

end
