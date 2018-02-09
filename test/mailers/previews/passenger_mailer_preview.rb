# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def booking_confirmation_email
    PassengerMailer.booking_confirmation_email(Passenger.first)
  end
end
