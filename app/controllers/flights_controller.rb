class FlightsController < ApplicationController
  
  def index
    @flights = Flight.all
    
  end

  def search
    # @flight = @flight.by_da(params[:departure_airport_id])
    # @flight = @flight.by_aa(params[:arrival_airport_id])
    
    @results = Array.new()
    @flight = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id],
      )
    # binding.pry
    @flight.each do |f|
      # flash[:notice] = "Processing"
      if f.start_date_time.strftime("%Y-%m-%d") == params[:start_date_time]
        @results << f
      end
    end
  end

  private
  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start_date_time)
  end  

end
