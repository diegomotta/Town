class API::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :json
def index
  	@events = Event.all
    respond_to do |format|
      format.json { render json: @events, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
  	@event = Event.find(params[:id])
    respond_to do |format|
        format.json { render json: @event, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.json {render json: @event, status: :ok  }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @event = Event.find(params[:event_id])
    respond_to do |format|
      if @event.update(event_params)
        format.json { render json: @event, status: :ok }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @event = Event.find(params[:event_id])
    @event.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:parent_id,:type)
    end
end
