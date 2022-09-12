class AddSessionIdToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :checkout_session_id, :string
  end
end
