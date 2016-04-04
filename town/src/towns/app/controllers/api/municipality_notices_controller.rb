class API::MunicipalityNoticesController < ApplicationController
   before_action :set_municipality_notice, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_notices = @municipality.notices
    respond_to do |format|
       format.json { render json: @municipality_notices, status: :ok  }
     end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_notice = @municipality.notices.find(params[:id])
    respond_to do |format|
        format.json { render json: @municipality_notice, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_notice = @municipality.notices.build(municipality_notice_params)  	
    respond_to do |format|
      if @municipality_notice.save
        format.json {render json: @municipality_notice, status: :ok  }
      else
        format.json { render json: @municipality_notice.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_notice= @municipality.notices.find(params[:id])
    respond_to do |format|
      if @municipality_notice.update(municipality_notice_params)
        format.json { render json: @municipality_notice, status: :ok }
      else
        format.json { render json: @municipality_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @municipality = Municipality.find(params[:municipality_id])
    @municipality_notice = @municipality.notices.find(params[:id])
    @municipality_notice.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipality_notice
      @municipality_notice = MunicipalityNotice.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def municipality_notice_params
      params.require(:notice).permit(:description,:start_date, :end_date, :responsable_id, :email,:title)
    end
end

