class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]

  before_action :ensure_current_user_is_follower, only: [:update, :edit, :destroy]

  def ensure_current_user_is_follower
    unless current_user == @follow.follower
      redirect_to :back, alert: "Nice try."
    end
  end

  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
  end

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows
  # POST /follows.json
  def create
    @follow = Follow.new(follow_params)
    @follow.follower_id = current_user.id

    respond_to do |format|
      if @follow.save
        format.html { redirect_to @follow, notice: 'Follow was successfully created.' }
        format.json { render action: 'show', status: :created, location: @follow }
      else
        format.html { render action: 'new' }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to follows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follow_params
      params.require(:follow).permit(:follower_id, :followee_id)
    end
end
