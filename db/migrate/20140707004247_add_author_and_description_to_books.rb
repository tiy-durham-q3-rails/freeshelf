class AddAuthorAndDescriptionToBooks < ActiveRecord::Migration
  def change
    remove_column :books, :copyright, :string
    add_column :books, :author, :string
    add_column :books, :description, :text
  end
end
