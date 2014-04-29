require 'ostruct'
require 'yaml'

stylist_settings = YAML.load_file("#{Rails.root}/config/stylist.yml")[Rails.env].with_indifferent_access ||
                   YAML.load_file("#{Rails.root}/config/example_stylist.yml")[Rails.env].with_indifferent_access

StylistInfo = OpenStruct.new(stylist_settings[:info])
StylistSMTP = OpenStruct.new(stylist_settings[:smtp])

ActionMailer::Base.smtp_settings = {
  address:              StylistSMTP.address,
  port:                 StylistSMTP.port,
  user_name:            StylistSMTP.user_name,
  password:             StylistSMTP.password,
  authentication:       StylistSMTP.authentication,
  enable_starttls_auto: StylistSMTP.enable_starttls_auto,
}