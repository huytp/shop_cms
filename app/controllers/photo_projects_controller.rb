class PhotoProjectsController < ApplicationController
  before_action :set_photo_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  # GET /photo_products
  # GET /photo_products.json
  def index
    @photo_projects = @project.photo_projects.all
  end

  # GET /photo_products/1
  # GET /photo_products/1.json
  def show
  end

  # GET /photo_products/new
  def new
    @photo_project = @project.photo_projects.new
  end

  # GET /photo_products/1/edit
  def edit
  end

  # POST /photo_products
  # POST /photo_products.json
  def create
    @photo_project = @project.photo_projects.new(photo_project_params)

    respond_to do |format|
      if @photo_project.save
        format.html { redirect_to project_photo_projects_path(@project), notice: 'Photo product was successfully created.' }
        format.json { render :show, status: :created, location: @photo_project }
      else
        format.html { render :new }
        format.json { render json: @photo_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_projects/1
  # PATCH/PUT /photo_projects/1.json
  def update
    respond_to do |format|
      if @photo_project.update(photo_project_params)
        format.html { redirect_to redirect_to project_photo_projects_path(@project), notice: 'Photo product was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_project }
      else
        format.html { render :edit }
        format.json { render json: @photo_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_projects/1
  # DELETE /photo_projects/1.json
  def destroy
    @photo_project.destroy
    respond_to do |format|
      format.html { redirect_to project_photo_projects_path(@project), notice: 'Photo product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_project
      @photo_project = PhotoProject.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_project_params
      params.require(:photo_project).permit(:image)
    end
end
