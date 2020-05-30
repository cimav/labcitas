class Student < ApplicationRecord
  #self.table_name = "sapos_production.students"
  belongs_to :staff, :foreign_key => "supervisor", :class_name => "Staff"
end
