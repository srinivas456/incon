class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :attach_file_name      
      t.string :attach_content_type
      t.string :attach_file_size
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
