class RenameColumnFromAppointment < ActiveRecord::Migration[6.1]
  def change
  	rename_column :appointments, :patient_id,  :user_id  
  end
end
