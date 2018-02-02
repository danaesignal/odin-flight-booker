class AddOriginIdAndDestinationIdToFlights < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :origin_id, :integer
    add_column :flights, :destination_id, :integer
  end
end
