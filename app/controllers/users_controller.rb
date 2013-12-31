class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :show
  before_action :set_user, only: [:show, :edit, :update_user, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.build_user_school
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def new_user
    password_length = 8
    password = Devise.friendly_token.first(password_length)
    params[:user][:password] = password
    params[:user][:password_confirmation] = password
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        #send welcome mail with password
        UserMailer.welcome_email(@user,password).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:user).permit(:password, :password_confirmation, :role, :phone, :group, :first_name, :last_name, :email,user_school_attributes:[:my_school_id])
    end
end
