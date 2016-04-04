class API::RadioNoticesController < ApplicationController
   before_action :set_radio_notice, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
    @radio = Radio.find(params[:radio_id])
    @radio_notices = @radio.notices
    respond_to do |format|
       format.json { render json: @radio_notices, status: :ok  }
     end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @radio = Radio.find(params[:radio_id])
    @radio_notice = @radio.notices.find(params[:id])
    respond_to do |format|
        format.json { render json: @radio_notice, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @radio = Radio.find(params[:radio_id])
    @radio_notice = @radio.notices.build(radio_notice_params)  	
    respond_to do |format|
      if @radio_notice.save
        format.json {render json: @radio_notice, status: :ok  }
      else
        format.json { render json: @radio_notice.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @radio = Radio.find(params[:radio_id])
    @radio_notice= @radio.notices.find(params[:id])
    respond_to do |format|
      if @radio_notice.update(radio_notice_params)
        format.json { render json: @radio_notice, status: :ok }
      else
        format.json { render json: @radio_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @radio = Radio.find(params[:radio_id])
    @radio_notice = @radio.notices.find(params[:id])
    @radio_notice.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio_notice
      @radio_notice = RadioNotice.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def radio_notice_params
      params.require(:notice).permit(:description,:start_date, :end_date, :responsable_id, :email,:title)
    end
end

