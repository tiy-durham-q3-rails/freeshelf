class Book < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable

  validates :title, presence: true
  validates :author, presence: true

  mount_uploader :cover, CoverUploader
  mount_uploader :document, DocumentUploader

  has_many :favorites, :as => :favoritable

  scope :alphabetically, -> { order(:title)  }
  scope :date_added, -> { order(created_at: :desc) }
  scope :year_published, -> { order(publish_year: :desc) }
  scope :most_popular, -> { order(favorites_count: :desc)}

  def link
    if document?
      document.url
    else
      self.url
    end
  end
end
