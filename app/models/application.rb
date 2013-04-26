class Application < ActiveRecord::Base
  
 
  attr_accessible :application_name, :project_manager_id, :device_type, :tab_color, :nav_color, :application_type , :version, :attach_file_name, :attach, :style, :orientation
  attr_writer :current_step
  #validates :application_name, :presence => true

  belongs_to :project_manager, :class_name => "ProjectManager", :foreign_key => "project_manager_id"
  

  has_attached_file :attach

def current_step
  @current_step || steps.first
end

def steps
  %w[naming setting device page]
end

def next_step
  self.current_step = steps[steps.index(current_step)+1]
end

def previous_step
  self.current_step = steps[steps.index(current_step)-1]
end

def first_step?
  current_step == steps.first
end

def last_step?
  current_step == steps.last
end

def all_valid?
  steps.all? do |step|
    self.current_step = step
    valid?
  end
end
end