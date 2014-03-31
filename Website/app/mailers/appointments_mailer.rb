class AppointmentsMailer < ActionMailer::Base
  include Icalendar #imports Event object
  
  default from: Application.config.from_email_address,
          to: Application.config.to_email_address,
          subject: "New appointment"
  
  def new_appointment_stylist(appointment)
    @appmnt = appointment
    ics_attachment = StringIO.new(create_ics().to_ical)
    attachments['appointment.ics'] = ics_attachment.read
    ics_attachment.close
    mail()
  end
  
  private
  def create_ics()
    event = Event.new
    event.start = @appmnt.date
    event.summary = 'Name: ' + @appmnt.firstname + ' ' + @appmnt.lastname '\n'\
                    'Service: ' + @appmnt.service + '\n'\
                    'Date: ' + @appmnt.date + '\n'\
                    'Email: ' + @appment.email
    return event
  end
end