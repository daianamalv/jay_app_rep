class CreatePlaceImages < ActiveRecord::Migration[6.0]
  def change
    create_table :place_images do |t|
      t.integer :place_id
      t.string :image

      t.timestamps
    end
  end
end
