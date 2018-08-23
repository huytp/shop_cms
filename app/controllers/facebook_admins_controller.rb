class FacebookAdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facebook_admin, only: [:edit, :update, :destroy]

  # GET /facebook_admins
  # GET /facebook_admins.json
  def index
    @facebook_admins = FacebookAdmin.all
  end

  # GET /facebook_admins/new
  def new
    @facebook_admin = FacebookAdmin.new
  end

  # GET /facebook_admins/1/edit
  def edit
  end

  # POST /facebook_admins
  # POST /facebook_admins.json
  def create
    @facebook_admin = FacebookAdmin.new(facebook_admin_params)

    respond_to do |format|
      if @facebook_admin.save
        format.html { redirect_to facebook_admins_path, notice: 'Facebook admin was successfully created.' }
        format.json { render :show, status: :created, location: @facebook_admin }
      else
        format.html { render :new }
        format.json { render json: @facebook_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebook_admins/1
  # PATCH/PUT /facebook_admins/1.json
  def update
    respond_to do |format|
      if @facebook_admin.update(facebook_admin_params)
        format.html { redirect_to facebook_admins_path, notice: 'Facebook admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @facebook_admin }
      else
        format.html { render :edit }
        format.json { render json: @facebook_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_admins/1
  # DELETE /facebook_admins/1.json
  def destroy
    @facebook_admin.destroy
    respond_to do |format|
      format.html { redirect_to facebook_admins_url, notice: 'Facebook admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_admin
      @facebook_admin = FacebookAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_admin_params
      params.require(:facebook_admin).permit(:admin_id)
    end
end
