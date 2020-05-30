class LaboratoryAdmin < ApplicationRecord
  belongs_to :laboratory 
  belongs_to :user 
end
