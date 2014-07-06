class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :copyright
      t.integer :publish_year
      t.string :url

      t.timestamps
    end
  end
end
