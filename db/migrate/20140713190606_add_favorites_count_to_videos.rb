class AddFavoritesCountToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :favorites_count, :integer
  end
end
