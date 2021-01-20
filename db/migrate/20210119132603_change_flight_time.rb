class ChangeFlightTime < ActiveRecord::Migration[6.0]
  def change
    change_column :flights, :time, :time
  end
end
