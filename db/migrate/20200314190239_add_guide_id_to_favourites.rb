class AddGuideIdToFavourites < ActiveRecord::Migration[6.0]
  def change
    add_column :favourites, :guide_id, :integer
    remove_column :favourites, :user_id
  end
end
