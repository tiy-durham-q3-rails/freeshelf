class AddSuggestionListLastLookedAtUsers < ActiveRecord::Migration
  def change
    add_column :users,:last_looked, :datetime
  end
end
