class RemovePlaceIdFromVideos < ActiveRecord::Migration[7.0]
  def change
    remove_column :videos, :place_id, :string
  end
end
