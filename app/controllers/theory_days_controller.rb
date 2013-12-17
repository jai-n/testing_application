class TheoryDaysController < ApplicationController
  before_action :set_theory_day, only: [:show, :edit, :update, :destroy]

  # GET /theory_days
  # GET /theory_days.json
  def index
    @theory_days = TheoryDay.all
  end

  # GET /theory_days/1
  # GET /theory_days/1.json
  def show
  end

  # GET /theory_days/new
  def new
    @theory_day = TheoryDay.new
  end

  # GET /theory_days/1/edit
  def edit
  end

  # POST /theory_days
  # POST /theory_days.json
  def create
    @theory_day = TheoryDay.new(theory_day_params)

    respond_to do |format|
      if @theory_day.save
        format.html { redirect_to @theory_day, notice: 'Theory day was successfully created.' }
        format.json { render action: 'show', status: :created, location: @theory_day }
      else
        format.html { render action: 'new' }
        format.json { render json: @theory_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theory_days/1
  # PATCH/PUT /theory_days/1.json
  def update
    respond_to do |format|
      if @theory_day.update(theory_day_params)
        format.html { redirect_to @theory_day, notice: 'Theory day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @theory_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theory_days/1
  # DELETE /theory_days/1.json
  def destroy
    @theory_day.destroy
    respond_to do |format|
      format.html { redirect_to theory_days_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theory_day
      @theory_day = TheoryDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theory_day_params
      params.require(:theory_day).permit(:start_date, :start_time, :end_time, :repeat_weekly, :school_class_id)
    end
end
