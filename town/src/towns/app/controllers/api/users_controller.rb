class  API::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  	respond_to do |format|
      format.json { render json: @users, status: :ok  }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  	@user = User.find(params[:id])
    respond_to do |format|
        format.json { render json: @user, status: :ok }	
    end
  end

  # POST /users
  # POST /users.json
  def create
    #@user = User.sign_up(user_params)
    @user = User.create(user_params)
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render json: @user, status: :ok  }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:person_id,:username,:password,:password_confirmation,:email,:last_signin,:role_id)
    end
end
