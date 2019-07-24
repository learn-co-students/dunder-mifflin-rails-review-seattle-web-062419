class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id))
    
    if @employee.save
      redirect_to @employee
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    byebug
  end

  def update
    @employee = Employee.find(params[:id])
  
    if @employee
      @employee.update(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id))
      redirect_to @employee
    else
      render :edit
    end
  end

  private
  def employee_params(*args)
    params.require(:employee).permit(*args)
  end
end
