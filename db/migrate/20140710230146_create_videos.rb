class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :contributor
      t.string :summary
      t.string :link

      t.timestamps
    end
  end
end
