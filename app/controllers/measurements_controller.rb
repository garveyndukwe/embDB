class MeasurementsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_project
    before_action :set_forest
    before_action :set_tree
    before_action :set_measure, only: [:show, :edit, :update, :destroy]

    def index
      @measurements = Measurement.order(:tree_code).page(params[:page]).per(20)
      redirect_to [@project,@forest, @tree]
    end

    def new
      @measurement = @tree.measurements.build
    end

    def create
      @measurement = @tree.measurements.build(measure_params)
      #@forest =@project.forests.build(forest_params)
      if !@measurement.valid?
        flash.now[:notice] = "Invalid measurement form parameters"
        render "new"
      elsif @measurement.save
        flash.now[:notice] = "Measurement has been created"
        redirect_to [@project,@forest, @tree]
      else
        flash.now[:alert] = "Measurement has not been created"
        render(:action=>new)
      end
    end

    def update
      if @measurement.update(measure_params)
        flash[:notice] = "Measurement has been updated."
        redirect_to project_forest_tree_measurement_path #[@project, @forest]
      else
        flash[:alert] = "Measurement has not been updated."
        render(:action=>edit)
      end

    end

    def edit
    end

    def show
    end

    def destroy
      @measurement.destroy
      flash[:notice] = "Measurement has been deleted"
      redirect_to @tree
      redirect_to project_forest_tree_measurement_path #[@project, @forest]

    end
    private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_forest
      @forest = Forest.find(params[:forest_id])
    end

    def set_tree
      @tree = Tree.find(params[:tree_id])
    end

    def set_measure
      @measurement = @tree.measurements.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The Measurement #{:id} you were looking for could not be found."
      redirect_to project_forest_tree_measurements_path
    end
    def measure_params
      params.require(:measurement).permit(:tree_code, :year_taken, :girth, :height)
    end


end
