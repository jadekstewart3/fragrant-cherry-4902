class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects


  def contestant_count
    self.contestants.count
  end

  def average_years_of_contestant_experience
    self.contestants.average(:years_of_experience)
  end
end
