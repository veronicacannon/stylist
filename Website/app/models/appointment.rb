class Appointment < ActiveRecord::Base
  attr_accessible :appot, :email, :first_name, :last_name, :message, :phone, :service
end
