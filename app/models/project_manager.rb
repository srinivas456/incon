class ProjectManager < ActiveRecord::Base
  attr_accessible :project_name, :applications_attributes

#Validations
#validates :project_name, :presence => true

#ass

has_many :applications, :dependent => :destroy

accepts_nested_attributes_for :applications

end
