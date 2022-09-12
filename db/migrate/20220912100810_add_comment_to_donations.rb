class AddCommentToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :message, :text
  end
end
