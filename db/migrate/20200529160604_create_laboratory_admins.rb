class CreateLaboratoryAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :laboratory_admins do |t|
      t.references :laboratory
      t.references :user
      t.timestamps
    end
  end
end
