class API::SearchController < ApplicationController
 	before_action :set_search_event, only: [:searchevent]
    respond_to :json
	def searchevent
	    @municipality_events = @municipality.events.search_event(params[:start_date],params[:end_date])
	    respond_to do |format|
      		format.json { render json: @municipality_events, status: :ok  }
    	end
	end
    # Use callbacks to share common setup or constraints between actions.
	private 
		def set_search_event
		  @municipality = Municipality.find(params[:municipality_id])
		end
end
