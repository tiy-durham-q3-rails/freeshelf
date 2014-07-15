class AddPolymorphicRefToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :book_id, :integer
    remove_column :comments, :video_id, :integer
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
