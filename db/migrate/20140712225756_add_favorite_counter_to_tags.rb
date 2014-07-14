class AddFavoriteCounterToTags < ActiveRecord::Migration
  def change
    add_column :tags, :favorites_count, :integer, :default => 0
  end
end
