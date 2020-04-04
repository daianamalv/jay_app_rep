class AddAvatarLinkToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :avatar_link, :string
  end
end
