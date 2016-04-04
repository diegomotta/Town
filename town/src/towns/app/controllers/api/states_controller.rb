class API::StatesController < ApplicationController

	before_action :set_state, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /states
  # GET /states.json

  def index
    @country =Country.find(params[:country_id])
    @states = @country.states
    respond_to do |format|
      format.json { render json: @states, status: :ok  }
    end
  end

  # GET /states/1
  # GET /countrys/1.json
  def show
    @country =Country.find(params[:country_id])
    @state = @country.states.find(params[:id])
    respond_to do |format|
        format.json { render json: @state, status: :ok }	
    end  	 
  end

  # POST /states
  # POST /states.json
  def create
    @country =Country.find(params[:country_id])
    @state = @country.states.new(state_params)
    respond_to do |format|
      if @state.save
        format.json { render json: @state, status: :ok  }
      else
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    @country =Country.find(params[:country_id])
    @state = @country.states.find(params[:id])      
    respond_to do |format|
      if @state.update(state_params)
        format.json { render json: @state, status: :ok  }
      else
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @country =Country.find(params[:country_id])
    @state = @country.states.find(params[:id])         
    @state.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @town = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:name)
    end
end
