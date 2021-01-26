class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :mountain_id
      t.string :name
      t.string :image
      t.text :description
      t.date :date
      t.integer :comments_count

      t.timestamps
    end
  end
end
