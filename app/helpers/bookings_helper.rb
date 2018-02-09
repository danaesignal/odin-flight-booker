module BookingsHelper
  def send_confirmation_emails(booking)
    booking.passengers.each do |passenger|
      PassengerMailer.booking_confirmation_email(passenger).deliver_now
    end
  end
end
