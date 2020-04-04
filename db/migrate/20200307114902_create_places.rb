class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.integer :tour_id
      t.integer :point_id
      t.integer :guide_id

      t.timestamps
    end
  end
end
