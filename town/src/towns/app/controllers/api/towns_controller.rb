class API::TownsController < ApplicationController
  before_action :set_town, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /towns
  # GET /towns.json
  def index
    @department = Department.find(params[:department_id])
    @towns = @department.towns
    respond_to do |format|
      format.json { render json: @towns, status: :ok  }
    end
  end

  # GET /towns/1
  # GET /towns/1.json
  def show
    @department = Department.find(params[:department_id])
    @towns = @department.towns.find(params[:id])
    respond_to do |format|
        format.json { render json: @town, status: :ok }  
    end  
  end

  # GET /towns/1/edit
  # POST /towns
  # POST /towns.json
  def create
    @department = Department.find(params[:department_id])
    @town = @department.towns.new(town_params)
    respond_to do |format|
      if @town.save
        format.json { render json: @town, status: :ok }
      else
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /towns/1
  # PATCH/PUT /towns/1.json
  def update
    @department = Department.find(params[:department_id])
    @town = @department.towns.find(params[:id])    
    respond_to do |format|
      if @town.update(town_params)
        format.json { render json: @town, status: :ok }
      else
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /towns/1
  # DELETE /towns/1.json
  def destroy
    @department = Department.find(params[:department_id])
    @town = @department.towns.find(params[:id])        
    @town.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_town
      @town = Town.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def town_params
      params.require(:town).permit(:name, :year_founded, :elevation, :population, :latitude, :longitude, :time_zone, :cpa_base, :dialing_code, :subdomain)
    end
end
