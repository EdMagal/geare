class AddUserToGrus < ActiveRecord::Migration[7.0]
  def change
    add_reference :grus, :user, null: false, foreign_key: true
  end
end
