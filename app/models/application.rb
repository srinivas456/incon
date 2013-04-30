class Application
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :application_name, :type => String
  field :nav_color, :type => String
  field :application_type, :type => String
  field :device_type, :type => String
  field :attach_file_name, :type => String
  field :attach_file_size, :type => String
  field :orientation, :type => String
  field :style, :type => String
  field :project_manager_id, :type => Integer
  field :version, :type => Integer
  field :tab_color, :type => String
  # field :navigation_color, :type => Text 
  # referenced_in :project_manager

  attr_accessible :application_name, :project_manager_id, :device_type, :tab_color, :nav_color, :application_type , :version, :attach_file_name, :attach, :style, :orientation
  attr_writer :current_step
  #validates :application_name, :presence => true

  belongs_to :project_manager, :class_name => "ProjectManager", :foreign_key => "project_manager_id"
  

  #has_attached_file :attach

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