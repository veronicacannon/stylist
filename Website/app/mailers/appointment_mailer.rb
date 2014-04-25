class AppointmentMailer < ActionMailer::Base
  default from: "haircut@ltol.com"

  def appointment_email(appointment)
    @appointment = appointment
    mail(to: 'me@veronicacannon.com', 
    	subject: 'Hair Appointment with Alicia',
    	context_type: 'text/html')
end
end
