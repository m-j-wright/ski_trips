class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :image
      t.text :bio
      t.integer :trips_count
      t.integer :comments_count

      t.timestamps
    end
  end
end
