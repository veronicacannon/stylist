class Service < ActiveRecord::Base
  attr_accessible :service_description, :service_time_estimate
  has_many :appointments

  #validates service time is no greater than 3 hours

  validates_numericality_of :service_time_estimate, :greater_than => 0
  validates_numericality_of :service_time_estimate, :less_than => 181

end
