class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_description
      t.integer :service_time_estimate

      t.timestamps
    end
  end
end
