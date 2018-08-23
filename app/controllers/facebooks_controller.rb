class FacebooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facebook, only: [:edit, :update]

  def index
    @facebooks = Facebook.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @facebook.update(facebook_params)
        format.html { redirect_to facebooks_path, notice: 'Facebook was successfully updated.' }
        format.json { render :show, status: :ok, location: @facebook }
      else
        format.html { render :edit }
        format.json { render json: @facebook.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook
      @facebook = Facebook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebook_params
      params.require(:facebook).permit(:app_id, :comment_active, :like_active)
    end
end
