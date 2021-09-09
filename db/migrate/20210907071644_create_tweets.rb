class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets, id: :uuid do |t|
      t.string :content
      t.uuid :user_id

      t.timestamps
    end
  end
end
