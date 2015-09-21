class StatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_status,  only: [:show, :edit, :update, :destroy]

  def index
    #all_status, @code = Status.find_by_code(params[:code])
    @statuses = Status.order(:code)
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      flash[:notice] = "Status has been saved."
      redirect_to @status
    else
      flash[:alert] = "Status has not been saved."
      render "new"
    end
  end

  def edit
  end

  def show

  end

  def update
    if @status.update(status_params)
      flash[:notice] = "Status has been updated."
      redirect_to @status
    else
      flash[:alert] = "Status has not been updated."
      render "edit"
    end
  end

  def destroy
    @status.destroy
    flash[:notice] = "Status has been deleted."
    redirect_to status_path
  end

  private

  def status_params
    params.require(:status).permit(:code, :description)
  end

  def set_status
    @status = Status.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The status you were looking for could not be found."
    redirect_to status_path
  end


end
