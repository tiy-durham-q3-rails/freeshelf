class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  has_many :books
  has_many :videos
  has_many :favorites
  has_many :favorite_books, :through => :favorites,
           :source => :favoritable, :source_type => "Book"
  has_many :favorite_tags, :through => :favorites,
           :source => :favoritable, :source_type => "ActsAsTaggableOn::Tag"

  acts_as_tagger

  def confirm_password_present
    if password.blank?
      errors.add(:password, "must be present")
    end
  end
end
