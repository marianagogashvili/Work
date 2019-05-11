class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]
  before_action :require_employee, only: [:edit, :update, :destroy]
  before_action :require_logged_in, only: [:new, :create]
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      session[:employee_id] = @employee.id
      redirect_to employee_path(params[:id])
    else
      render 'new'
    end
  end

  def show
    @employee = Employee.find_by(id: params[:id])
    @your_applications = [] 
    for job in JobEmployee.where(employee_id: @employee.id)
      @your_applications.push([Job.find(job.job_id), job.approved])
    end
    @saved_for_later = []
    for saved in Saved.where(employee_id: @employee.id)
      @saved_for_later.push(Job.find(saved.job_id))
    end
  end

  def edit
    
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(params[:id])
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
  def require_employee
    if session[:employee_id] != @employee.id
      redirect_to root_path
    end
  end
  def require_logged_in
    if session[:employee_id] == nil
      redirect_to login_path
    end
  end

end