class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @contestants_not_working_on_project = Contestant.not_working_on_project(@project)
  end
end