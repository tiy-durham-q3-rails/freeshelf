class StandardizeVideoColumns < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.rename :author, :creator
      t.rename :publish_year, :year_created
      t.index :year_created
    end

    change_table :videos do |t|
      t.rename :contributor, :creator
      t.rename :summary, :description
      t.rename :link, :url
      t.integer :year_created
      t.index :year_created
    end
  end
end
