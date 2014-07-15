require 'typhoeus/adapters/faraday'

class Video < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable

  validates :title, presence: true
  validates :creator, presence: true
  validates :slug, presence: true

  belongs_to :user

  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged

  def slug_candidates
    [:title, [:title, :creator]]
  end
end
