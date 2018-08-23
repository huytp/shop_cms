class PropertyProjectsController < ApplicationController
  before_action :set_property_project, only: [:show, :edit, :update, :destroy]

  # GET /property_projects
  # GET /property_projects.json
  def index
    @property_projects = PropertyProject.all
  end

  # GET /property_projects/1
  # GET /property_projects/1.json
  def show
  end

  # GET /property_projects/new
  def new
    @property_project = PropertyProject.new
  end

  # GET /property_projects/1/edit
  def edit
  end

  # POST /property_projects
  # POST /property_projects.json
  def create
    @property_project = PropertyProject.new(property_project_params)
    @property_project.slug = @property_project.name.parameterize
    respond_to do |format|
      if @property_project.save

        format.html { redirect_to @property_project, notice: 'Property project was successfully created.' }
        format.json { render :show, status: :created, location: @property_project }
      else
        format.html { render :new }
        format.json { render json: @property_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_projects/1
  # PATCH/PUT /property_projects/1.json
  def update
    respond_to do |format|
      if @property_project.update(property_project_params)
        @property_project.slug = params[:property_project][:name].parameterize
        @property_project.save
        format.html { redirect_to @property_project, notice: 'Property project was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_project }
      else
        format.html { render :edit }
        format.json { render json: @property_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_projects/1
  # DELETE /property_projects/1.json
  def destroy
    @property_project.destroy
    respond_to do |format|
      format.html { redirect_to property_projects_url, notice: 'Property project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_project
      @property_project = PropertyProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_project_params
      params.require(:property_project).permit(:name)
    end
end
