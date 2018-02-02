class ChangeDurationColumnToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :flights, :duration, :integer
  end
end
