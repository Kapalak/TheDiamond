class Api::V1::EmployeesController < ApplicationController
  before_action :set_api_v1_employee, only: [:show, :update, :destroy]

  # GET /api/v1/employees
  def index
    @api_v1_employees = Api::V1::Employee.all

    render json: @api_v1_employees
  end

  # GET /api/v1/employees/1
  def show
    render json: @api_v1_employee
  end

  # POST /api/v1/employees
  def create
    @api_v1_employee = Api::V1::Employee.new(api_v1_employee_params)

    if @api_v1_employee.save
      render json: @api_v1_employee, status: :created, location: @api_v1_employee
    else
      render json: @api_v1_employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/employees/1
  def update
    if @api_v1_employee.update(api_v1_employee_params)
      render json: @api_v1_employee
    else
      render json: @api_v1_employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/employees/1
  def destroy
    @api_v1_employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_employee
      @api_v1_employee = Api::V1::Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_employee_params
      params.fetch(:api_v1_employee, {})
    end
end
