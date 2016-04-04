class API::RadiosController < ApplicationController
 before_action :set_radio, only: [:show, :edit, :update, :destroy]
 respond_to :json
# GET /departments
# GET /departments.json
def index
	@radios = Radio.all
  respond_to do |format|
    format.json { render json: @radios, status: :ok  }
  end
end

# GET /departments/1
# GET /countrys/1.json
def show
  @radio = Radio.find(params[:id])
  respond_to do |format|
      format.json { render json: @radio, status: :ok }	
  end  	   	
end

# POST /departments
# POST /departments.json
def create
  @radio = Radio.new(radio_params)  	
  respond_to do |format|
    if @radio.save
      format.json {render json: @radio, status: :ok  }
    else
      format.json { render json: @radio.errors, status: :unprocessable_entity }
    end
  end
end
# PATCH/PUT /departments/1
# PATCH/PUT /departments/1.json
def update
  @radio = Radio.find(params[:id])
  respond_to do |format|
    if @radio.update(radio_params)
      format.json { render json: @radio, status: :ok }
    else
      format.json { render json: @radio.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /departments/1
# DELETE /departments/1.json
def destroy
  @radio = Radio.find(params[:id])
  @radio.destroy
  respond_to do |format|
    format.json { render json: {}, status: :ok  }
  end
end
private
  # Use callbacks to share common setup or constraints between actions.
  def set_radio
    @radio = Radio.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def radio_params
    params.require(:radio).permit(:name,:owner_id, :address_id, :telefone, :email)
  end
end

