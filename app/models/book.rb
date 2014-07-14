class Book < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable
  has_many :comments

  validates :title, presence: true
  validates :slug, presence: true
  validates :creator, presence: true
  validates :url, presence: true

  belongs_to :user
  has_many :favorites, :as => :favoritable

  scope :alphabetically, -> { order(:title)  }
  scope :date_added, -> { order(created_at: :desc) }
  scope :year_published, -> { order(year_created: :desc) }
  scope :most_popular, -> { order(favorites_count: :desc)}

  mount_uploader :cover, CoverUploader

  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged

  def slug_candidates
    [:title, [:title, :creator]]
  end
end
