class ProjectManager 
include Mongoid::Document
include Mongoid::Timestamps::Created

  field :project_name, :type => String
  #references_many :application

attr_accessible :project_name, :applications_attributes

#Validations
validates :project_name, :presence => true

#Associations
has_many :applications, :dependent => :destroy

accepts_nested_attributes_for :applications

# def self.search(search)
# 	 if search	 	
# 	    find(:all, :conditions => ['project_name LIKE ? or applications.application_name LIKE ? ', "%#{search}%", "%#{search}%"], :include => [:applications])
# 	  else
# 	    find(:all)
# 	  end
#   end



end
