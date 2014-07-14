class RemoveDocumentFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :document, :string
  end
end
