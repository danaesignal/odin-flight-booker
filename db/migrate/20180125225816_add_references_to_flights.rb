class AddReferencesToFlights < ActiveRecord::Migration[5.1]
  def change
    remove_column :flights, :origin_id
    remove_column :flights, :destination_id

    add_foreign_key :flights, :airports, column: :origin_id, primary_key: "id"
    add_foreign_key :flights, :airports, column: :destination_id, primary_key: "id"

    add_index :flights, :origin_id
    add_index :flights, :destination_id
  end
end
