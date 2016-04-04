class API::MunicipalitiesController < ApplicationController
 before_action :set_municipality, only: [:show, :edit, :update, :destroy]
 respond_to :json
# GET /departments
# GET /departments.json
def index
	@municipalities = Municipality.all
  respond_to do |format|
    format.json { render json: @municipalities, status: :ok  }
  end
end

# GET /departments/1
# GET /countrys/1.json
def show
  @municipality = Municipality.find(params[:id])
  respond_to do |format|
      format.json { render json: @municipality, status: :ok }	
  end  	   	
end

# POST /departments
# POST /departments.json
def create
  @municipality = Municipality.new(municipality_params)  	
  respond_to do |format|
    if @municipality.save
      format.json {render json: @municipality, status: :ok  }
    else
      format.json { render json: @municipality.errors, status: :unprocessable_entity }
    end
  end
end
# PATCH/PUT /departments/1
# PATCH/PUT /departments/1.json
def update
  @municipality = Municipality.find(params[:id])
  respond_to do |format|
    if @municipality.update(municipality_params)
      format.json { render json: @municipality, status: :ok }
    else
      format.json { render json: @municipality.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /departments/1
# DELETE /departments/1.json
def destroy

  @municipality = Municipality.find(params[:id])
  @municipality.destroy
  respond_to do |format|
    format.json { render json: {}, status: :ok  }
  end
end
private
  # Use callbacks to share common setup or constraints between actions.
  def set_municipality
    @municipality = Municipality.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def municipality_params
    params.require(:municipality).permit(:mayor_id,:submayor_id,:address_id)
  end
end
