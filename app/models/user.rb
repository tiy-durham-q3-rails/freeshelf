class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  has_many :books
  has_many :favorites
  has_many :favorite_books, :through => :favorites,
           :source => :favoritable, :source_type => "Book"
  has_many :favorite_tags, :through => :favorites,
           :source => :favoritable, :source_type => "ActsAsTaggableOn::Tag"

  before_save :create_api_token

  acts_as_tagger

  def confirm_password_present
    if password.blank?
      errors.add(:password, "must be present")
    end
  end

  def create_api_token
    if api_token.blank?
      self.api_token = build_api_token
    end
  end

  def build_api_token
    begin
      token = SecureRandom.urlsafe_base64
    end while User.exists?(api_token: token)
    token
  end
end
