class AddDocumentToBooks < ActiveRecord::Migration
  def change
    add_column :books, :document, :string
  end
end
