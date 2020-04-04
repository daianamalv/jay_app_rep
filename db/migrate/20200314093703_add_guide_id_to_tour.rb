class AddGuideIdToTour < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :guide_id, :integer
  end
end
