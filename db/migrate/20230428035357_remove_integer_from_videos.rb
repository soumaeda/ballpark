class RemoveIntegerFromVideos < ActiveRecord::Migration[7.0]
  def change
    remove_column :videos, :integer, :string
  end
end
