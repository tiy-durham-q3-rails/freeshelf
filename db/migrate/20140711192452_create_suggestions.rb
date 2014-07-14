class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|

      t.timestamps
    end
  end
end
