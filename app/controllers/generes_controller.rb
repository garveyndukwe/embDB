class GeneresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_genere,  only: [:show, :edit, :update, :destroy]

  def index
    #all_generes, @code = Genere.find_by_code(params[:code])
    @generes = Genere.order(:code).page(params[:page]).per(20)
  end

  def new
    @genere = Genere.new
  end

  def create
    @genere = Genere.new(genere_params)
    if @genere.save
      flash[:notice] = "Specie has been saved."
      redirect_to @genere
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
    if @genere.update(genere_params)
      flash[:notice] = "genere has been updated."
      redirect_to @genere
    else
      flash[:alert] = "genere has not been updated."
      render "edit"
    end
  end

  def destroy
    @genere.destroy
    flash[:notice] = "Specie has been destroyed."
    redirect_to generes_path
  end

  private

  def genere_params
    params.require(:genere).permit(:code, :botanical_name,:common_name)
  end

  def set_genere
    @genere = Genere.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The genere you were looking for could not be found."
    redirect_to generes_path
  end

end
