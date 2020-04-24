class AddCoverToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :cover, :string
  end
end
