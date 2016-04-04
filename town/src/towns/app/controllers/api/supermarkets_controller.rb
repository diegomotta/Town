class API::SupermarketsController < ApplicationController
  before_action :set_supermarket, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /supermarkets
  # GET /supermarkets.json
  def index
    @supermarkets = Supermarket.all
    respond_to do |format|
      format.json { render json: @supermarkets, status: :ok } 
    end   
  end

  # GET /supermarkets/1
  # GET /supermarkets/1.json
  def show
    @supermarket = Supermarket.find(params[:id])
    respond_to do |format|
        format.json { render json: @supermarket, status: :ok } 
    end     
  end

  # GET /supermarkets/new

  # POST /supermarkets
  # POST /supermarkets.json
  def create
    @supermarket = Supermarket.new(supermarket_params)
    respond_to do |format|
      if @supermarket.save
        format.json { render json: @supermarket, status: :ok  }
      else
        format.json { render json: @supermarket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supermarkets/1
  # PATCH/PUT /supermarkets/1.json
  def update
    @supermarket = Supermarket.find(params[:id])  
    respond_to do |format|
      if @supermarket.update(supermarket_params)
        format.json { render json: @supermarket, status: :ok }
      end
    end
  end

  # DELETE /supermarkets/1
  # DELETE /supermarkets/1.json
  def destroy
    @supermarket = Supermarket.find(params[:id])  
    @supermarket.destroy
    respond_to do |format|
      format.json { render json: @supermarket, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supermarket
      @supermarket = Supermarket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supermarket_params
      params.require(:supermarket).permit(:name, :owner_id, :address_id, :telefone, :email)
    end
end
