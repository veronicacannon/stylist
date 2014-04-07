class AddServiceIdColumnToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :service_id, :integer
  end
end
