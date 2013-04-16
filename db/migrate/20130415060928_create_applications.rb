class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :title
      t.integer :version
      t.string :type 
      t.string :device_type 
      t.string :application_name
      t.integer :project_manager_id
      t.timestamps
    end
  end
end
