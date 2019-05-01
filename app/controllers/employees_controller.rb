class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :show, :destroy]
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      session[:employee_id] = @employee.id
      redirect_to employee_path(@employee)
    else
      render 'new'
    end
  end

  def show
    @your_applications = [] 
    for job in JobEmployee.where(employee_id: @employee.id)
      @your_applications.push(Job.find(job.job_id))
    end
  end

  def edit
    
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee)
    else
      render 'edit'
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit(:full_name, :email, :address, :password)
  end
  def set_employee
    @employee = Employee.find(params[:id])
  end

end