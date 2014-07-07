require 'securerandom'

class PasswordReset < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

  before_create :set_token
  before_create :set_expires_at

  def set_token
    self.token = SecureRandom.urlsafe_base64
  end

  def set_expires_at
    self.expires_at = DateTime.now + 1.day
  end
end
