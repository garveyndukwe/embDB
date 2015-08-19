class ForestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_forest, only: [:generate, :show, :edit, :update, :destroy]

    def index
      @forests = Forest.all
      redirect_to [@project,@forest]
    end

    def new
      @forest = @project.forests.build
    end

  def generate

  end
    def create
      @forest =@project.forests.build(forest_params)

      if @forest.save
        flash[:notice] = "Forest project has been created"
        redirect_to [@project, @forest]
      else
        flash[:alert] = "Forest project has not been created"
        render "new"
      end
    end

    def edit
    end
  def show

  end

    def update
      if @forest.update(forest_params)
        flash[:notice] = "Forest has been updated."
        redirect_to [@project, @forest]
      else
        flash[:alert] = "Forest has not been updated."
        render action: "edit"
      end
    end

    def destroy
      @forest.destroy
      flash[:notice] = "Forest has been deleted"
      redirect_to @project
    end

   private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_forest
      @forest = @project.forests.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The forest you were looking for could not be found."
    redirect_to project_forests_path
  end

  def forest_params
      params.require(:forest).permit(:name,:description,:plantation,:specie, :established, :enumerated, :area, :location, :gps, :comment)
  end

end