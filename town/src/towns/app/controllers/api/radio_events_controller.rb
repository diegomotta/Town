class API::RadioEventsController < ApplicationController
   before_action :set_radio_event, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
    @radio = Radio.find(params[:radio_id])
    @radio_events = @radio.events
    respond_to do |format|
       format.json { render json: @radio_events, status: :ok  }
     end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @radio = Radio.find(params[:radio_id])
    @radio_event = @radio.events.find(params[:id])
    respond_to do |format|
        format.json { render json: @radio_event, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @radio = Radio.find(params[:radio_id])
    @radio_event = @radio.events.build(radio_event_params)  	
    respond_to do |format|
      if @radio_event.save
        format.json {render json: @radio_event, status: :ok  }
      else
        format.json { render json: @radio_event.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @radio = Radio.find(params[:radio_id])
    @radio_event= @radio.events.find(params[:id])
    respond_to do |format|
      if @radio_event.update(radio_event_params)
        format.json { render json: @radio_event, status: :ok }
      else
        format.json { render json: @radio_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @radio = Radio.find(params[:radio_id])
    @radio_event = @radio.events.find(params[:id])
    @radio_event.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio_event
      @radio_event = RadioEvent.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def radio_event_params
      params.require(:event).permit(:name,:description,:start_date, :end_date, :responsible_id, :contact_number, :email, :address_id)
    end
end

