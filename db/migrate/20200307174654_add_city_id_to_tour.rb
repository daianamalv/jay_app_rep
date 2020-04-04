class AddCityIdToTour < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :city_id, :integer
  end
end
