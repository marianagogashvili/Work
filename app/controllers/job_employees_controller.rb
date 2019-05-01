class JobEmployeesController < ApplicationController
  before_action :require_employer, only: [:disapprove, :approve]
  def create
    @job_employee = JobEmployee.new(job_id: params[:id], employee_id: session[:employee_id])
    @job = Job.find(params[:id])
    if check() == false
      if @job.vacant = true
        @job_employee.save
      end
    end
  end

  def check
    if JobEmployee.find_by(job_id: params[:id], employee_id: session[:employee_id]) != nil
      return true
    else
      return false
    end
  end

  def approve
    @je = JobEmployee.find(params[:id])
    @je.update(approved: true)
    redirect_to employer_path(session[:employer_id])
  end

  def disapprove
    @je = JobEmployee.find(params[:id])
    @je.update(approved: false)
    redirect_to employer_path(session[:employer_id])

  end

  private
  def je_params
    params.require(:job_employee).permit(:job_id, :employee_id)
  end
  def require_employer
    @je = JobEmployee.find(params[:id])
    @job = Job.find(@je.job_id)
    if !logged_in? || session[:employer_id] != @job.employer.id
      redirect_to jobs_path
    end
  end
end