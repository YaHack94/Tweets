class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :Title
      t.text :Content

      t.timestamps
    end
  end
end
