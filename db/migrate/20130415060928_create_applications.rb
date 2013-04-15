class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :title
      t.integer :version
      #t.column :type, "ENUM('navi-based', 'tab-based', 'view-based')"
      #t.column :device_type, "ENUM('tablet', 'phone', 'both')"
      t.string :application_name
      t.integer :project_manager_id
      t.timestamps
    end
  end
end
