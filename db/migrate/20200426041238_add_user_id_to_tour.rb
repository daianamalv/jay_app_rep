class AddUserIdToTour < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :user_id, :integer
  end
end
