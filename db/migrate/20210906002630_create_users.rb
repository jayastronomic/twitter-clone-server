class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :name
      t.string :bio
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
