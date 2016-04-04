class API::SupermarketEventsController < ApplicationController
  before_action :set_supermarket_event, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /departments
  # GET /departments.json
  def index
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_events = @supermarket.events
    respond_to do |format|
      format.json { render json: @supermarket_events, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_event = @supermarket.events.find(params[:id])
    respond_to do |format|
        format.json { render json: @supermarket_event, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_event = @supermarket.events.build(supermarket_event_params)  	
    respond_to do |format|
      if @supermarket_event.save
        format.json {render json: @supermarket_event, status: :ok  }
      else
        format.json { render json: @supermarket_event.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_event= @supermarket.events.find(params[:id])
    respond_to do |format|
      if @supermarket_event.update(supermarket_event_params)
        format.json { render json: @supermarket_event, status: :ok }
      else
        format.json { render json: @supermarket_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_event = @supermarket.events.find(params[:id])
    @supermarket_event.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supermarket_event
      @supermarket_event = SupermarketEvent.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def supermarket_event_params
      params.require(:event).permit(:name,:description,:start_date, :end_date, :responsible_id, :contact_number, :email, :address_id)
    end
end
