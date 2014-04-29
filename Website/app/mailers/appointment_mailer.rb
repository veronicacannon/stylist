class AppointmentMailer < ActionMailer::Base

  default from: StylistInfo.from_email_address
  
  def new_appointment_to_stylist(appointment)
    @appointment = appointment

    StringIO.open(create_ics.to_ical) do |ics|
      attachments['appointment.ics'] = ics.read
    end

    mail(to:      StylistInfo.email_address,
         subject: "Appointment request from #{@appointment.first_name} #{@appointment.last_name}")
  end
  
  def new_appointment_to_client(appointment)
    @appointment = appointment
    
    mail(to:      @appointment.email,
         subject: "Hair Appointment with #{StylistInfo.name}")
  end
  
  private

  def create_ics
    Icalendar::Calendar.new.tap do |cal|
      cal.event do |event|
        event.dtstart = @appointment.appot
        event.summary = "Appointment with #{@appointment.first_name}"
        event.description = description
      end
    end
  end

  def description
    String.new.tap do |d|
      d << "Name: #{@appointment.first_name} #{@appointment.last_name} \n"
      d << "Date: #{@appointment.appot} \n"
      d << "Service: #{@appointment.service.service_description} \n"
      d << "Email: #{@appointment.email} \n"
      d << "Phone: #{@appointment.phone} \n"
      d << "Message: #{@appointment.message}"
    end
  end
end