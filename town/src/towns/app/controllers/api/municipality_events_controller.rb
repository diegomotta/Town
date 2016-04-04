class API::MunicipalityEventsController < ApplicationController
   before_action :set_municipality_event, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
    @municipality = Municipality.find(params[:municipality_id])
  	@municipality_events = @municipality.events
    #render :json=>  @municipality_events
    respond_to do |format|
       format.json { render json: @municipality_events, status: :ok  }
     end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_event = @municipality.events.find(params[:id])
    respond_to do |format|
        format.json { render json: @municipality_events, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_event = @municipality.events.build(municipality_event_params)  	
    respond_to do |format|
      if @municipality_event.save
        format.json {render json: @municipality_event, status: :ok  }
      else
        format.json { render json: @municipality_event.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_event = @municipality.events.find(params[:id])
    respond_to do |format|
      if @municipality_event.update(municipality_params)
        format.json { render json: @municipality_event, status: :ok }
      else
        format.json { render json: @municipality_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_event = @municipality.events.find(params[:id])
    @municipality_event.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipality_event
      @municipality_event = MunicipalityEvent.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def municipality_event_params
      params.require(:event).permit(:name,:description,:start_date, :end_date, :responsible_id, :contact_number, :email, :address_id)
    end
end

