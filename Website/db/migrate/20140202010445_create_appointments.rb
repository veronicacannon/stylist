class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.datetime :appot
      t.text :service
      t.text :message

      t.timestamps
    end
  end
end
