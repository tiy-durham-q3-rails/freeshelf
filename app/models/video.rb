class Video < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable

  validates :title, presence: true
  validates :contributor, presence: true

end
