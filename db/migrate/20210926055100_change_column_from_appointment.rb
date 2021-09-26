class ChangeColumnFromAppointment < ActiveRecord::Migration[6.1]
  def change
  	change_column :appointments ,:day  ,:date
  end
end
