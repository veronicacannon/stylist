ActionMailer::Base.smtp_settings = {
  address:              'mail.ltol.com',
  port:                 587,
  user_name:            'haircut@ltol.com',
  password:             'Stylist14',
  authentication:       'login',
  enable_starttls_auto: false
}