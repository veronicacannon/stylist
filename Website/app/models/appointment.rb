class Appointment < ActiveRecord::Base
  attr_accessible :appot, :email, :first_name, :last_name, :message, :phone, :service

# validate First Name - field is filled out, and more than one character less than 15
  validates :first_name, presence: true

# validate Last Name - field is filled out, and more than one character less than 15

  validates :last_name, presence: true

# validate Email - field is filled out, and use regex

  validates :email, presence: true

#phone - field is filled out, 10 numbers required, auto fill numbers for later 

  validates :phone, presence: true



=begin

4. appot = date/time 
6. service - must be defined as checkbox

what happens if the one clients wants to make multiple appointments?
=end


end