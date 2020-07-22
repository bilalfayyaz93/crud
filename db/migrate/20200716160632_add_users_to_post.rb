class AddUsersToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :users, null: false, foreign_key: true
  end
end
