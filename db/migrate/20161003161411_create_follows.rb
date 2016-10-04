class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :reverse_follower_id

      t.timestamps
    end
  end
end