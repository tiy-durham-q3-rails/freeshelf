class Book < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable

  validates :title, presence: true
  validates :slug, presence: true
  validates :creator, presence: true

  mount_uploader :cover, CoverUploader

  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged

  def slug_candidates
    [:title, [:title, :creator]]
  end
end
