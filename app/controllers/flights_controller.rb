class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    # @departure_airport = params[:departure_airport]
    # @arrival_airport = params[:arrival_airport]
    # @departure_time = params[:start_date_time]
    # flash[:notice]= "Search"
    # @flight = Flight.where(
    #   departure_airport: Airport.where(code: @departure_airport),
    #   arrival_airport: Airport.where(code: @arrival_airport),
    #   start_date_time: Flight.where(start_date_time: @departure_time)
    # )
  end

  def search
    # flight_params()
    @flights = Flight.all
    flash[:notice]= "Search"

    # @flight = Flight.where(
    #   departure_airport_id: params[:arrival_airport_id],
    #   arrival_airport_id: params[:arrival_airport_id],
    #   start_date_time: params[:start_date_time_id]
    # )
    @flight = Flight.find_by(flight_params)
    if @flight.nil?
      flash[:notice] = "No available flights"
    else
      flash[:notice] = "Found"
    end
    # flash[:notice] = params[:departure_airport_id]
    # @search=Flight.all.search(params[:search][:departure_airport_id], params[:search][:arrival_airport_id], params[:search][:start_date_time])
    # if @search.present?
    #   flash[:notice] = "Found your flight"
    #   @search
    # else 
    #   flash[:notice] = "No available flights"
    # end
    render @flight
  end

  private
  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start_date_time)
  end  

end
