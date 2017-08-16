class AddAvatarXToFriends < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :avatar_x, :string
  end
end
