class JobEmployeesController < ApplicationController

  def create
    @employee = Employee.find(session[:employee_id])
    @job = Job.find(params[:id])
    @job_employee = JobEmployee.new(job_id: @job.id, employee_id: @employee.id)
    if check() == false
      @job_employee.save
    end
  end

  def check
    if JobEmployee.find_by(job_id: @job.id, employee_id: @employee.id) != nil
      return true
    else
      return false
    end
  end

  private
  def je_params
    params.require(:job_employee).permit(:job_id, :employee_id)
  end
end