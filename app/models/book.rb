class Book < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable
  has_many :comments

  validates :title, presence: true
  validates :author, presence: true

  mount_uploader :cover, CoverUploader
  mount_uploader :document, DocumentUploader

  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged
  validates_presence_of :title, :slug

  def slug_candidates
    [:title, [:title, :author]]
  end

  def link
    if document?
      document.url
    else
      self.url
    end
  end
end
