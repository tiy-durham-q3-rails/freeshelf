class Book < ActiveRecord::Base
  acts_as_taggable

  validates :title, presence: true
  # validates :url, presence: true, uniqueness: true
  validates :author, presence: true

  mount_uploader :cover, CoverUploader
  mount_uploader :document, DocumentUploader

  def link
    if document?
      document.url
    else
      self.url
    end
  end
end
