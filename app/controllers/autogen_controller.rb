class AutogenController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_forest
  def index
  end

  def tree
    @message = "helo" <<  params.to_s
  end

  def report
  end
  private
  def set_project
    #@project = Project.find(params[:project_id])
  end

  def set_forest
    #@forest = Forest.find(params[:forest_id])
  end
end
