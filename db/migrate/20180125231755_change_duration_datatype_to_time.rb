class ChangeDurationDatatypeToTime < ActiveRecord::Migration[5.1]
  def change
    change_column :flights, :duration, :time
  end
end
