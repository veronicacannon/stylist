class Emailer < ActionMailer::Base
  include Icalendar #.ics file gem class that includes Event
  
  default from: Application.config.send_email_address,
          to: Application.config.receive_email_address,
          subject: "New appointment"
  
  def send_appontment_email(appointment)
    @appmnt = appointment
    create_ics()
    ics_attachment = StringIO.new(@event.to_ical)
    attachments['appointment.ics'] = ics_attachment.read
    ics_attachment.close
    mail()
  end
  
  private
  def create_ics()
    @event = Event.new
    @event.start = @appmnt.date
    @event.summary = 'Name: ' + @appmnt.firstname + ' ' + @appmnt.lastname '\n' + 'Service: ' + @appmnt.service
  end
end