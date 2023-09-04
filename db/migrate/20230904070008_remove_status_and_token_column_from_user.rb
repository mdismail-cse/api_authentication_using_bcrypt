class RemoveStatusAndTokenColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :token, :string, default: 0
    remove_column :users, :status, :string, default: "inactive"
  end
end
