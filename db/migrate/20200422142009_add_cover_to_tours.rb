class AddCoverToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :cover, :string
  end
end
