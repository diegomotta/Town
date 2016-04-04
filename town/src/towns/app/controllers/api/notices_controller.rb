class API::NoticesController < ApplicationController
	  before_action :set_notice, only: [:show, :edit, :update, :destroy]
    respond_to :json
def index
  	@notices = Notice.all
    respond_to do |format|
      format.json { render json: @notices, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
  	@notice = Notice.find(params[:id])
    respond_to do |format|
        format.json { render json: @notice, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @notice = Notice.new(notice_params)
    respond_to do |format|
      if @notice.save
        format.json {render json: @notice, status: :ok  }
      else
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @notice = Notice.find(params[:notice_id])
    respond_to do |format|
      if @notice.update(notice_params)
        format.json { render json: @notice, status: :ok }
      else
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @notice = notice.find(params[:notice_id])
    @notice.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = notice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:parent_id,:type)
    end
end
