class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  before_action :ensure_user_is_current_user, only: [:update, :destroy]

  def ensure_user_is_current_user
    unless current_user == @user
      redirect_to :back, alert: "Nice try."
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :avatar, :avatar_cache)
    end
end
