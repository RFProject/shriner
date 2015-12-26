class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.float :tweet_id, :unique => true
      t.datetime :row_created_at
      t.string :latitude
      t.string :longitude
      t.string :shrine

      t.timestamps null: false
    end
  end
end
