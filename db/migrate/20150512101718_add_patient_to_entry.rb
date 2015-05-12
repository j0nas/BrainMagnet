class AddPatientToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :patient_id, :integer
  end
end
