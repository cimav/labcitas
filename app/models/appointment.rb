class Appointment < ApplicationRecord
  belongs_to :laboratory
  belongs_to :user
  belongs_to :student

  PROGRAMMED = 1
  ASSIST     = 2
  NOT_ASSIST = 3
  DELETED    = 99
  
end
