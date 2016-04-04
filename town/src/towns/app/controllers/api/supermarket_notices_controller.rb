class API::SupermarketNoticesController < ApplicationController
   before_action :set_supermarket_notice, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_notices = @supermarket.notices
    respond_to do |format|
      format.json { render json: @supermarket_notices, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_notice = @supermarket.notices.find(params[:id])
    respond_to do |format|
        format.json { render json: @supermarket_notice, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_notice = @supermarket.notices.build(supermarket_notice_params)  	
    respond_to do |format|
      if @supermarket_notice.save
        format.json {render json: @supermarket_notice, status: :ok  }
      else
        format.json { render json: @supermarket_notice.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_notice= @supermarket.notices.find(params[:id])
    respond_to do |format|
      if @supermarket_notice.update(supermarket_notice_params)
        format.json { render json: @supermarket_notice, status: :ok }
      else
        format.json { render json: @supermarket_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @supermarket = Supermarket.find(params[:supermarket_id])
    @supermarket_notice = @supermarket.notices.find(params[:id])
    @supermarket_notice.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supermarket_notice
      @supermarket_notice = SupermarketNotice.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def supermarket_notice_params
      params.require(:notice).permit(:description,:start_date, :end_date, :responsible_id, :email,:title)
    end
end
