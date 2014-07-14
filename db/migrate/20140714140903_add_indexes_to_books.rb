class AddIndexesToBooks < ActiveRecord::Migration
  def change
    add_index :books, :title
    add_index :books, :favorites_count
    add_index :books, :created_at
  end
end
