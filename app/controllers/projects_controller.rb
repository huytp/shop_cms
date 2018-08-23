class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :update_feature]
  before_action :get_property_category, only: [:new, :edit, :create, :update]
  before_action :get_category_current, only: [:edit, :update]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  def update_feature
    if @project.feature == true
      @project.feature = false
    else
      @project.feature = true
    end
    @project.save
    redirect_to projects_path
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.property = params[:property].to_hash
    respond_to do |format|
      if @project.save
        (params[:projects][:category_ids]).each {|id| @project.project_categories.create(category_project_id: id)}
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        @project.property = params[:property].to_hash
        @project.save
        @project.project_categories.destroy_all
        (params[:projects][:category_ids]).each {|id| @project.project_categories.create(category_project_id: id)}
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def get_category_current
      @categories_select = @project.project_categories.pluck(:category_project_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :property, :slug, :meta_title, :meta_keyword, :meta_description)
    end

    def get_property_category
      @properties = PropertyProject.all
      @categories = CategoryProject.pluck(:title, :id)
    end
end
