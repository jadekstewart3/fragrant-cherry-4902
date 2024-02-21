class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  scope :not_working_on_project, -> (project) { where.not(id: project.contestants.pluck(:id)) }
end
