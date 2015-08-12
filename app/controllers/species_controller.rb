class SpeciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_specie,  only: [:show, :edit, :update, :destroy]

  def index
    @species = Specie.all
  end

  def new
    @species = Specie.new
  end

  def create
    @species = Specie.new(specie_params)
    if @species.save
      flash[:notice] = "Specie has been saved."
      redirect_to @species
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
   if @species.update(specie_params)
        flash[:notice] = "specie has been updated."
        redirect_to @species
    else
        flash[:alert] = "specie has not been updated."
        render "edit"
    end
end

    def destroy
      @species.destroy
      flash[:notice] = "Specie has been destroyed."
      redirect_to species_path
    end

private

    def specie_params
      params.require(:species).permit(:code, :botanical_name,:common_name)
    end

    def set_specie
      @species = Specie.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The specie you were looking for could not be found."
      redirect_to species_path
    end
end
