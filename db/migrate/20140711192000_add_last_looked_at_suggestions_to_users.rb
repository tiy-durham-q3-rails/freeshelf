class AddLastLookedAtSuggestionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_looked_at_suggestions, :datetime, :default => DateTime.now
  end
end
