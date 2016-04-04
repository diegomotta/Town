class API::DelegationsController < ApplicationController
   before_action :set_delegation, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
    @municipality = Municipality.find(params[:municipality_id])
  	@delegations = @municipality.delegations
    respond_to do |format|
      format.json { render json: @delegations, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @municipality = Municipality.find(params[:municipality_id])
  	@delegation = @municipality.delegations.find(params[:id])
    respond_to do |format|
        format.json { render json: @delegation, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @municipality = Municipality.find(params[:municipality_id])
    @delegation = @municipality.delegations.new(delegation_params)  	
    respond_to do |format|
      if @municipality.save
        format.json {render json: @delegation, status: :ok  }
      else
        format.json { render json: @delegation.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @municipality = Municipality.find(params[:municipality_id])
    @delegation = @municipality.delegations.find(params[:id])
    respond_to do |format|
      if @delegation.update(delegation_params)
        format.json { render json: @delegation, status: :ok }
      else
        format.json { render json: @delegation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @municipality = Municipality.find(params[:municipality_id])
    @delegation = @municipality.delegations.find(params[:id])
    @delegation.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delegation
      @delegation = Delegation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delegation_params
      params.require(:delegation).permit(:chief_id,:address_id)
    end
end
