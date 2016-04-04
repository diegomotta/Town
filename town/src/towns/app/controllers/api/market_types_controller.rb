class  API::MarketTypesController < ApplicationController
 before_action :set_market_type, only: [:show, :edit, :update, :destroy]
 respond_to :json
# GET /departments
# GET /departments.json
def index
	@market_types = MarketType.all
  respond_to do |format|
    format.json { render json: @market_types, status: :ok  }
  end
end

# GET /departments/1
# GET /countrys/1.json
def show
  @market_type = MarketType.find(params[:id])
  respond_to do |format|
      format.json { render json: @market_type, status: :ok }	
  end  	   	
end

# POST /departments
# POST /departments.json
def create
  @market_type = MarketType.new(market_type_params)  	
  respond_to do |format|
    if @market_type.save
      format.json {render json: @market_type, status: :ok  }
    else
      format.json { render json: @market_type.errors, status: :unprocessable_entity }
    end
  end
end
# PATCH/PUT /departments/1
# PATCH/PUT /departments/1.json
def update
  @market_type = MarketType.find(params[:id])
  respond_to do |format|
    if @market_type.update(market_type_params)
      format.json { render json: @market_type, status: :ok }
    else
      format.json { render json: @market_type.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /departments/1
# DELETE /departments/1.json
def destroy
  @market_type = MarketType.find(params[:id])
  @market_type.destroy
  respond_to do |format|
    format.json { render json: {}, status: :ok  }
  end
end
private
  # Use callbacks to share common setup or constraints between actions.
  def set_market_type
    @market_type = MarketType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def market_type_params
    params.require(:MarketType).permit(:name,:description)
  end
end

