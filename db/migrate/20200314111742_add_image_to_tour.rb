class AddImageToTour < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :image, :file
  end
end
