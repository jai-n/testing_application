class MySchoolsController < ApplicationController
  before_action :set_my_school, only: [:show, :edit, :update, :destroy]

  # GET /my_schools
  # GET /my_schools.json
  def index
    @my_schools = MySchool.all
  end

  # GET /my_schools/1
  # GET /my_schools/1.json
  def show
  end

  # GET /my_schools/new
  def new
    @my_school = MySchool.new
  end

  # GET /my_schools/1/edit
  def edit
  end

  # POST /my_schools
  # POST /my_schools.json
  def create
    @my_school = MySchool.new(my_school_params)

    respond_to do |format|
      if @my_school.save
        format.html { redirect_to @my_school, notice: 'My school was successfully created.' }
        format.json { render action: 'show', status: :created, location: @my_school }
      else
        format.html { render action: 'new' }
        format.json { render json: @my_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_schools/1
  # PATCH/PUT /my_schools/1.json
  def update
    respond_to do |format|
      if @my_school.update(my_school_params)
        format.html { redirect_to @my_school, notice: 'My school was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @my_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_schools/1
  # DELETE /my_schools/1.json
  def destroy
    @my_school.destroy
    respond_to do |format|
      format.html { redirect_to my_schools_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_school
      @my_school = MySchool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_school_params
      params.require(:my_school).permit(:name, :website_url, :company_name, :contact_name, :email, :phone_number, :vat_number, :address, :city, :post_code, :note, :active)
    end
end
