class AddCitiesToFriends < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :city, :string
  end
end
