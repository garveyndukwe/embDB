class TreesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_forest
  before_action :set_tree, only: [ :show, :edit, :update, :destroy]

  def index
    #@trees = Tree.all
    @trees = Tree.order(:code).page(params[:page]).per(10)

  end

 def new
   @tree = @forest.trees.build
 end



  def create
    @tree = @forest.trees.build(tree_params)

    if !@tree.valid?
      flash.now[:notice] = "Invalid Tree form parameters"
      render "new"
    elsif @tree.save
      flash.now[:notice] = "Tree project has been created"
      redirect_to [@project,@forest, @tree]
    else
      flash.now[:alert] = "Tree project has not been created"
      render(:action=>new)
    end
  end

  def update
    if @tree.update(tree_params)
      flash[:notice] = "Tree has been updated."
      redirect_to project_forest_tree_path #[@project, @forest]
    else
      flash[:alert] = "Tree has not been updated."
      render action: "edit"
    end

  end

  def edit
  end

  def show
  end

  def destroy
    @tree.destroy
    flash[:notice] = "Tree has been deleted"
    redirect_to @forest

  end
  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_forest
    @forest = Forest.find(params[:forest_id])
  end
  def set_tree
    @tree = @forest.trees.find(params[:id])
  end
  def tree_params
    params.require(:tree).permit(:code, :number,:specie,:status, :comment)
  end
end
