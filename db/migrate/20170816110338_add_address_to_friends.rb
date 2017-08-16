class AddAddressToFriends < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :address, :string
  end
end
