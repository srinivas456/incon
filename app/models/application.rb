class Application < ActiveRecord::Base
  attr_writer :current_step
 
  attr_accessible :application_name, :device_type, :title, :type, :version, :attach_file_name, :attach

  belongs_to :project_manager
  
  has_attached_file :attach

def current_step
  @current_step || steps.first
end

def steps
  %w[naming setting device]
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