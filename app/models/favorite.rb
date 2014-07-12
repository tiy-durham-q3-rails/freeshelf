class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favoritable, polymorphic: true, counter_cache: true
end
