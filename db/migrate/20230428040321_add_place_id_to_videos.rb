class AddPlaceIdToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :place_id, :integer
  end
end
