class CreateEmailConfirmations < ActiveRecord::Migration
  def change
    create_table :email_confirmations do |t|
      t.string :token
      t.datetime :expires_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
