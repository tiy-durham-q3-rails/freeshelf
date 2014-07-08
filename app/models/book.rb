class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :author, presence: true

  mount_uploader :cover, CoverUploader
end
