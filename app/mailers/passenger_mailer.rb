class PassengerMailer < ApplicationMailer
  default from: 'agl@makemytrip.in'

  def booking_confirmation
    @booking = Booking.find(params[:booking_id])
    @flight = Flight.find(@booking.flight_id)
    @url = booking_url(@booking)
    mail(to: @booking.passengers.pluck(:email), subject: "Your Booking confirmation for flight ID #{@flight.id}")
  end
end
