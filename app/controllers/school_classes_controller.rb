class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :edit, :update, :destroy]

  # GET /school_classes
  # GET /school_classes.json
  def index
    @school_classes = SchoolClass.all
  end

  # GET /school_classes/1
  # GET /school_classes/1.json
  def show
  end

  # GET /school_classes/new
  def new
    @my_school = MySchool.find(params[:my_school_id])
    @school_class = SchoolClass.new
    # @school_class.build_user_school
    @school_class.theory_days.build
    @school_class.users.build
    @users = User.not_admin
  end

  # GET /school_classes/1/edit
  def edit
  end

  # POST /school_classes
  # POST /school_classes.json
  def create    

    @school_class = SchoolClass.new(school_class_params)
    
    respond_to do |format|
       debugger
      if @school_class.save
        unless @school_class.users.blank?
          @school_class.users.each do |user|
            user.build_user_school(:my_school_id=>params[:my_school_id]).save
            #send welcome mail with password
            # UserMailer.welcome_email(user,'password',"generate password").deliver
          end
        end
        format.html { redirect_to my_schools_path, notice: 'Class was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school_class }
      else
        # @my_school = MySchool.find(params[:my_school_id])
        # @users = User.not_admin
        format.html { render action: 'new', error: @school_class.errors }
        format.json { render json: @school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_classes/1
  # PATCH/PUT /school_classes/1.json
  def update
    respond_to do |format|
      if @school_class.update(school_class_params)
        format.html { redirect_to my_schools_path, notice: 'School class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_classes/1
  # DELETE /school_classes/1.json
  def destroy
    @school_class.destroy
    respond_to do |format|
      format.html { redirect_to my_schools_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_class
      @school_class = SchoolClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_class_params
      # debugger
      params.require(:school_class).permit(:my_school_id,:name, :start_date, :end_date,theory_days_attributes:[:start_date,:start_time,:end_time,:repeat_weekly,:_destroy],users_attributes:[:password, :password_confirmation,:first_name,:last_name,:email,:role,:group,:phone,:_destroy])
      # params.require(:school_class).permit(:name, :start_date, :end_date,theory_days_attributes:[:start_date,:start_time,:end_time,:repeat_weekly,:_destroy])
      #params.require(:school_class).permit(:name, :start_date, :end_date)
    end
end
