class AddFavoritesCountToBooks < ActiveRecord::Migration
  def change
    add_column :books, :favorites_count, :integer, :default => 0

    Book.all.each do |book|
      book.update_attribute(:favorites_count, book.favorites.count)
    end
  end
end
