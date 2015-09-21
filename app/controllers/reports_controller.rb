class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_report,  only: [:show, :edit, :update, :destroy]

  def index
    @reports = Report.all
    @reports = Report.page(params[:page])

  end

  def by_specie

  end
  def by_forest

  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:notice] = "Specie has been saved."
      redirect_to @report
    else
      flash[:alert] = "Specie has not been saved."
      render "new"
    end
  end

  def edit
  end

  def show

  end

  def update
    if @report.update(report_params)
      flash[:notice] = "report has been updated."
      redirect_to @report
    else
      flash[:alert] = "report has not been updated."
      render "edit"
    end
  end

  def destroy
    @report.destroy
    flash[:notice] = "Report has been destroyed."
    redirect_to reports_path
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def report_params
    params.require(:report).permit(:code, :botanical_name,:common_name)
  end

  def set_report
    @report = Report.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The report you were looking for could not be found."
    redirect_to reports_path
  end

end
