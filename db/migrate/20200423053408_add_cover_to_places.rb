class AddCoverToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :cover, :string
  end
end
