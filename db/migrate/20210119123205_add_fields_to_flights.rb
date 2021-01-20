class AddFieldsToFlights < ActiveRecord::Migration[6.0]
  def change
    add_reference :flights, :from_airport, index: true, foreign_key: { to_table: :airports }
    add_reference :flights, :to_airport, index: true, foreign_key: { to_table: :airports }
    add_column :flights, :time, :datetime
    add_column :flights, :duration, :integer
  end
end
