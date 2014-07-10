class Book < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable

  validates :title, presence: true
  validates :author, presence: true

  belongs_to :user

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
