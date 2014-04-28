class AppointmentMailer < ActionMailer::Base

  default from: Website::Application.config.from_email_address,
          subject: "Hair Appointment with #{Website::Application.config.stylist_name}"
  
  def new_appointment_to_stylist(appointment)
    @appointment = appointment

    StringIO.open(create_ics.to_ical) do |ics|
      attachments['appointment.ics'] = ics.read
    end

    mail(to: Website::Application.config.stylist_email_address)
  end
  
  def new_appointment_to_client(appointment)
    @appointment = appointment
    
    mail(to: @appointment.email)
  end
  
  private

  def create_ics
    Icalendar::Event.new.tap do |event|
      event.dtstart   = @appointment.appot
      event.summary = summary
    end
  end

  def summary
    String.new.tap do |summary|
      summary << "Name: #{@appointment.first_name} #{@appointment.last_name} \n"
      summary << "Date: #{@appointment.appot} \n"
      summary << "Service: #{@appointment.service} \n"
      summary << "Email: #{@appointment.email}"
      summary << "Phone: #{@appointment.phone}"
    end
  end
end