class AddAcStatusToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ac_status, :integer, default: 0
  end
end
