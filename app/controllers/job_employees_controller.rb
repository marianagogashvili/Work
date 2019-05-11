class JobEmployeesController < ApplicationController
  before_action :require_employer, only: [:disapprove, :approve]
  before_action :before_email, only: [:disapprove, :approve]
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
    @url1 = 'http://localhost:3000'
    @je.update(approved: true)
    UsermailerMailer.approved_email(@employee, @employer, @job).deliver_later
    redirect_to employer_path(session[:employer_id])
  end

  def disapprove
    @je.update(approved: false)
    UsermailerMailer.disapproved_email(@employee, @employer, @job).deliver_later
    redirect_to employer_path(session[:employer_id])
  end

  private
  def je_params
    params.require(:job_employee).permit(:job_id, :employee_id)
  end

  def require_employer
    @je = JobEmployee.find_by(job_id: params[:job_id])
    @job = Job.find(params[:job_id])
    if !logged_in? || session[:employer_id] != @job.employer.id
      redirect_to jobs_path
    end
  end

  def before_email
    @employee = Employee.find(@je.employee_id)
    @employer = @job.employer
    print("============================")
    print(@job.id)
    print(@je)
    print(@employee)
    print(@employer)

  end
end