class Application < ActiveRecord::Base
  attr_accessible :application_name, :device_type, :title, :type, :version

  belongs_to :project_manager

end
