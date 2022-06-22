class BookingsController < ApplicationController
  # before_action :booking_params
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:flight_id])
    @passengers_count = params[:passengers_count].to_i
    @passengers_count.times { @booking.passengers.build }
  end
  def create
    @booking = Booking.new(booking_params)
    @booking.confirmation_number = rand(10000..99999)
    if @booking.save
      flash[:notice] = 'Booking successfully completed!'
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'An error occured!'
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
  private
    def booking_params 
      params.require(:booking).permit(:flight_id, :no_of_passengers, passengers_attributes: [:name, :email])
    end
end
