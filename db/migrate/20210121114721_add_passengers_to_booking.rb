class AddPassengersToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :number_of_passengers, :integer
  end
end
