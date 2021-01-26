class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.string :status
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
