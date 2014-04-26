class Appointment < ActiveRecord::Base
  attr_accessible :appot, 
  				  :email, 
  		  	  	  :first_name, 
      		  	  :last_name, 
  				  :message, 
  				  :phone, 
  				  :service_id

  belongs_to :service

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, 
  					  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :phone, 
   					  :with => /\A\(?(\d{3})[-\)]?\s?(\d{3})[-\s]?(\d{4})\z/

end