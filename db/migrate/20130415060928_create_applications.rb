class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :attach_file_name      
      t.string :attach_content_type
      t.string :attach_file_size
      t.string :nav_color
      t.integer :version
      t.string :application_type 
      t.string :device_type 
      t.string :application_name
      t.text :tab_color
      t.text :navigation_color
      t.integer :project_manager_id
      t.string :orientation
      t.string :style
      t.timestamps
    end
  end
end
