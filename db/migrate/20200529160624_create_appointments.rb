class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :laboratory
      t.references :user
      t.references :student
      t.date       :appointment_date
      t.integer    :start
      t.integer    :end
      t.integer    :status
      t.text       :notes
      t.timestamps
    end
  end
end

