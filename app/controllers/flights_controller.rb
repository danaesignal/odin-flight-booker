class FlightsController < ApplicationController
  include FlightsHelper

  def index
    @all_airports ||= Airport.all.map{ |o| [o.code, o.id] }
    @raw_dates ||= Flight.find_by_sql("SELECT DISTINCT departure FROM flights ORDER BY departure asc")

    # We just want every day with at least one flight; this gets us that.
    @distinct_dates = @raw_dates.map{|o| [o.departure.to_date.strftime('%a, %e %b %Y'), o.departure.to_date]}.uniq

    # Don't try to call empty search params.
    unless params[:search].nil?
      origin_id =       search_params[:origin]
      destination_id =  search_params[:destination]
      filtered_flights = Flight.where(origin_id: origin_id, destination_id:
        destination_id)

      # @search_results = relevant_dates(filtered_flights, search_params[:departure])
      @search_results = relevant_dates(filtered_flights, search_params[:departure])
      @booking = Booking.new
      @headcount = params[:search][:passengers]
    end
  end

  private
  def search_params
    params.require(:search).permit(:origin,:destination,:departure,:passengers)
  end
end