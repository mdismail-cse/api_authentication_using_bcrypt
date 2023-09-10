class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :user_friend
      t.integer :status , default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
