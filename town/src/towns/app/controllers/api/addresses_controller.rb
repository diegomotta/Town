class API::AddressesController < ApplicationController
   before_action :set_address, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
  	@addresses = Address.all.to_json
     	respond_to do |format|
      format.json { render json: @addresses, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
  	@address = Address.find(params[:id])
    respond_to do |format|
        format.json { render json: @address, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
	@address = Address.new(address_params)
    respond_to do |format|
      if @address.save
        format.json {render json: @address, status: :ok  }
      else
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @address =Address.find(params[:id])
    respond_to do |format|
      if @address.update(address_params)
        format.json { render json: @address, status: :ok }
      else
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
	@address =Address.find(params[:id])
    @address.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:line_1,:line_2,:latitude,:longitude)
    end
end
