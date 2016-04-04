class API::EmployeesController < ApplicationController
   before_action :set_employee, only: [:show, :edit, :update, :destroy]
   respond_to :json
  # GET /departments
  # GET /departments.json
  def index
    @municipality = Municipality.find(params[:municipality_id])    
  	@employees = @municipality.employees
    respond_to do |format|
      format.json { render json: @employees, status: :ok  }
    end
  end

  # GET /departments/1
  # GET /countrys/1.json
  def show
    @municipality = Municipality.find(params[:municipality_id])
  	@employee = @municipality.employees.find(params[:id])
    respond_to do |format|
        format.json { render json: @employee, status: :ok }	
    end  	   	
  end

  # POST /departments
  # POST /departments.json
  def create
    @municipality = Municipality.find(params[:municipality_id])
    @employee = @municipality.employees.new(employee_params)  	
    respond_to do |format|
      if @employee.save
        format.json {render json: @employee, status: :ok  }
      else
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    @municipality = Municipality.find(params[:municipality_id])
    @employee = @municipality.employees.find(params[:id])
    respond_to do |format|
      if @employee.update(employee_params)
        format.json { render json: @employee, status: :ok }
      else
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @municipality = Municipality.find(params[:municipality_id])
    @employee = @municipality.employees.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok  }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:person_id,:name,:description,:start_date,:end_date)
    end
end
