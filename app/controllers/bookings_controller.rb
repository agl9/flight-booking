class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = Booking.new
    number_of_passengers = params[:booking][:number_of_passengers].to_i
    number_of_passengers.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash.notice = "Booking created!"
      redirect_to booking_path(@booking)
    else
      flash.notice = 'Fix errors!'
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
    flash.notice = "Thanks for using Makemytrip"
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,:number_of_passengers,passengers_attributes: [:suffix, :name, :email,:age])
  end
end