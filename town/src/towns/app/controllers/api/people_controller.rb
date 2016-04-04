class API::PeopleController < ApplicationController
   before_action :set_person, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
  	@people = Person.all
    respond_to do |format|
      format.json { render json: @people, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
  	@person = Person.find(params[:id])
    respond_to do |format|
        format.json { render json: @person, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
   	@person = Person.new(person_params)  	
    respond_to do |format|
      if @person.save
        format.json {render json: @person, status: :ok  }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @person = Person.find(params[:id])  
    respond_to do |format|
      if @person.update(person_params)
        format.json { render json: @person, status: :ok }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name,:last_name,:document_type_id,:document_number,:job_address_id,:birth_date,:home_address_id)
    end
end
