class PassengerMailer < ApplicationMailer
  default from: 'booking@odin-booker.com'

  def booking_confirmation_email(passenger)
    @passenger = passenger
    @booking = passenger.booking

    mail(to: @passenger.email, subject: 'Booking Confirmation')
  end
end
