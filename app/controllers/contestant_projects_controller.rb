class ContestantProjectsController < ApplicationController
  def create
    contestant = Contestant.find(params[:contestant_id])
    project = Project.find(params[:project_id])

    contestant_project = ContestantProject.create!(contestant_id: contestant.id, project_id: project.id)
    if contestant_project.save!
      redirect_to project_path(project)
    else 
      flash[:error] = "Please Select a valid Contestant."
    end
  end
end