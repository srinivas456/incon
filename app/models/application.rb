class Application < ActiveRecord::Base



  attr_accessible :application_name, :device_type, :title, :type, :version

  has_many :project_manager, :class_name => "ProjectManager", :foreign_key => "project_manager_id"

     

end
