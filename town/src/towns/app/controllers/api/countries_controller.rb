class API::CountriesController < ApplicationController
	before_action :set_country, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /countrys
  # GET /countrys.json
  def index
    @countries = Country.all.to_json
  	respond_to do |format|
      format.json { render json: @countries, status: :ok  }
    end
  end

  # GET /countrys/1
  # GET /countrys/1.json
  def show
  	@country = Country.find(params[:id])
    respond_to do |format|
        format.json { render json: @country, status: :ok }	
    end
  end

  # POST /countrys
  # POST /countrys.json
  def create
    @country = Country.new(country_params)
    
    respond_to do |format|
      if @country.save
        format.json { render json: @country, status: :ok }
      else
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countrys/1
  # PATCH/PUT /countrys/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.json { render json: @country, status: :ok  }
      else
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countrys/1
  # DELETE /countrys/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name)
    end
end

