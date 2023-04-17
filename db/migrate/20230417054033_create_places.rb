class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :place
      t.text :place_image

      t.timestamps
    end
  end
end
