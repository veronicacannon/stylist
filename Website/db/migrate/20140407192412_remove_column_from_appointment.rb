class RemoveColumnFromAppointment < ActiveRecord::Migration
  def up
    remove_column :appointments, :service
  end

  def down
    add_column :appointments, :service, :text
  end
end
