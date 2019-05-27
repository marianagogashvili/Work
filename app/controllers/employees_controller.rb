class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]
  before_action :require_employee, only: [:edit, :update, :destroy]
  before_action :if_logged_in, only: [:new, :create]
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      session[:employee_id] = @employee.id
      redirect_to employee_path(@employee.id)
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
    
    @ed = @employee.education.tr('[""]', '').split(",").to_a
    print(@ed)
    if (@ed == ["---\n"])
      @ed = nil
    end
  end

  def update
    if @employee.update(employee_params2)
      redirect_to employee_path(@employee.id)
    else
      render 'edit'
    end
  end

  def destroy
    @employee.destroy
    session[:employee_id] = nil
    redirect_to login_path
  end

  private
  def employee_params
    params.require(:employee).permit(:full_name, :email, :address, :password)
  end
  def employee_params2
    params.require(:employee).permit(:full_name, :email, :address, :career_level, :branch, :photo, :password, education: [])
  end
  
  def set_employee
    @employee = Employee.find(params[:id])
  end
  def require_employee
    if session[:employee_id] != @employee.id
      redirect_to root_path
    end
  end
  def if_logged_in
    if session[:employee_id] != nil
      redirect_to employee_path(session[:employee_id])
    end
  end

end