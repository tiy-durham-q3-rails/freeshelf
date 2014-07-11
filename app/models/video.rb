class Video < ActiveRecord::Base
  require 'faraday'
  require 'typhoeus'
  require 'typhoeus/adapters/faraday'
  paginates_per 15
  acts_as_taggable

  validates :title, presence: true
  validates :contributor, presence: true

end
