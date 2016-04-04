class API::DepartmentsController < ApplicationController
   before_action :set_department, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
  @state = State.find(params[:state_id])
  @departments = @state.departments
 	respond_to do |format|
      format.json { render json: @departments, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @state = State.find(params[:state_id])
    @department = @state.departments.find(params[:id])
    respond_to do |format|
        format.json { render json: @department, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @state = State.find(params[:state_id])
    @department = @state.departments.new(department_params)
    respond_to do |format|
      if @department.save
        format.json {render json: @department, status: :ok  }
      else
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @state =State.find(params[:state_id])
    @department = @state.departments.find(params[:id])  
    respond_to do |format|
      if @department.update(department_params)
        format.json { render json: @department, status: :ok }
      else
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @state =State.find(params[:state_id])
    @department = @state.departments.find(params[:id])      
    @department.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @town = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name)
    end
end