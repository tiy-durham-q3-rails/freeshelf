class Book < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable

  validates :title, presence: true
  validates :slug, presence: true
  validates :creator, presence: true
  validates :url, presence: true

  belongs_to :user
  has_many :favorites, :as => :favoritable

  mount_uploader :cover, CoverUploader

  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged

  def self.sort_by(params)
    direction = params[:order] == "asc" ? :asc : :desc
    order_by = case params[:sort]
                 when "alphabetically" then :title
                 when "date_added" then {created_at: direction}
                 when "year_published" then {year_created: direction}
                 when "most_popular" then {favorites_count: direction}
                 else nil
               end
    if order_by
      self.order(order_by)
    else
      self
    end
  end

  def slug_candidates
    [:title, [:title, :creator]]
  end
end
