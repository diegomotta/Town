class API::DocumentTypesController < ApplicationController
   before_action :set_document_type, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
  	@document_types = DocumentType.all
   	respond_to do |format|
        format.json { render json: @document_types, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
  	@document_type = DocumentType.find(params[:id])
    respond_to do |format|
        format.json { render json: @document_type, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
	@document_type = DocumentType.new(document_type_params)
    respond_to do |format|
      if @document_type.save
        format.json {render json: @document_type, status: :ok  }
      else
        format.json { render json: @document_type.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @document_type =DocumentType.find(params[:id])
    respond_to do |format|
      if @document_type.update(document_type_params)
        format.json { render json: @document_type, status: :ok }
      else
        format.json { render json: @document_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
	@document_type =DocumentType.find(params[:id])
    @document_type.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_type
      @document_type = DocumentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_type_params
      params.require(:document_type).permit(:name,:description)
    end
end
