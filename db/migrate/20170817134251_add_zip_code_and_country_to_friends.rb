class AddZipCodeAndCountryToFriends < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :zip_code, :string
    add_column :friends, :country, :string
  end
end
