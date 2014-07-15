require 'typhoeus/adapters/faraday'

class Video < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :creator, presence: true
  validates :slug, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged

  def slug_candidates
    [:title, [:title, :creator]]
  end
end
