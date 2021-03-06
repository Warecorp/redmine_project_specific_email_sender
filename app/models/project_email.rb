class ProjectEmail < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :email, :project_id
  validates_format_of :email, :with => /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i, :message => "is invalid"
end
