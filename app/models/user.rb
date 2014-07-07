class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  def confirm_password_present
    if password.blank?
      errors.add(:password, "must be present")
    end
  end
end
