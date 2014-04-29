require 'ostruct'
require 'yaml'

if File.exists? ("#{Rails.root}/config/stylist.yml")
  stylist_configs = YAML.load_file("#{Rails.root}/config/stylist.yml")[Rails.env].with_indifferent_access || {}
else
  stylist_configs = YAML.load_file("#{Rails.root}/config/example_stylist.yml")[Rails.env].with_indifferent_access
end

StylistInfo = OpenStruct.new(stylist_configs[:info])
StylistMail = OpenStruct.new(stylist_configs[:mail])
StylistSMTP = OpenStruct.new(stylist_configs[:smtp])

ActionMailer::Base.raise_delivery_errors = StylistMail.raise_delivery_errors
ActionMailer::Base.perform_deliveries = StylistMail.perform_deliveries
ActionMailer::Base.delivery_method = StylistMail.delivery_method
ActionMailer::Base.smtp_settings = {
  :address              => StylistSMTP.address,
  :port                 => StylistSMTP.port,
  :user_name            => StylistSMTP.user_name,
  :password             => StylistSMTP.password,
  :authentication       => StylistSMTP.authentication,
  :enable_starttls_auto => StylistSMTP.enable_starttls_auto,
}
