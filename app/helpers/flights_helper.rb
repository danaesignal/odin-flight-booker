module FlightsHelper

  def relevant_dates(flights, departure_time)
    flights.select{|x| x.departure.to_date == departure_time.to_date}
  end
end
