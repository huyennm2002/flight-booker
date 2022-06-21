class BookingsController < ApplicationController
  def index
    @bookings=Booking.all
  end

  def new
    @booking = Booking.new(booking_params)
  end
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:message] = "You have successfully booked"
    else
      flash[:notice] = "Failed to book"
    end
  end

  private
    def booking_params 
      params.require(:booking).permit(:flight_id)
    end
end
