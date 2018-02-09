class BookingsController < ApplicationController
  include BookingsHelper
  
  def new
    @headcount = params[:headcount].to_i
    @booking = Booking.new(booking_params)

    @headcount.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      send_confirmation_emails(@booking)
      redirect_to @booking
    else
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = Booking.all.count
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id,
        :passengers_attributes => [:name, :email])
    end
end
