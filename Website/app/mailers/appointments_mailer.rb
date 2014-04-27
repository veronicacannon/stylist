class AppointmentsMailer < ActionMailer::Base

  default from: Application.config.from_email_address,
          to: Application.config.to_email_address,
          subject: "Hair Appointment"
  
  def new_appointment_to_stylist(appointment)
    @appmnt = appointment

    StringIO.open(create_ics.to_ical) do |ics|
      attachments['appointment.ics'] = ics.read
    end

    mail
  end
  
  private

  def create_ics
    Icalendar::Event.new.tap do |event|
      event.start   = @appmnt.date
      event.summary = summary
    end
  end

  def summary
    String.new.tap do |summary|
      summary << "Name: #{@appmnt.firstname} #{@appmnt.lastname} \n"
      summary << "Date: #{@appmnt.date} \n"
      summary << "Service: #{@appmnt.service} \n"
      summary << "Email: #{@appment.email}"
    end
  end
end