class Application < ActiveRecord::Base
  
 
  attr_accessible :application_name, :project_manager_id, :device_type, :tab_color, :nav_color, :application_type , :version, :attach_file_name, :attach, :style, :orientation, :navigation_color
  #validates :application_name, :presence => true

  belongs_to :project_manager, :class_name => "ProjectManager", :foreign_key => "project_manager_id"
  

  has_attached_file :attach

end