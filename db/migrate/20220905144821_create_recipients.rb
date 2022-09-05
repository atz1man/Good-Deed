class CreateRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipients do |t|
      t.string :name
      t.text :bio
      t.string :profile_photo
      t.string :qr_code
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
