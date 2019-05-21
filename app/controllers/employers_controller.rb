class EmployersController < ApplicationController
  before_action :set_employer, only: [:edit, :update, :show, :destroy]
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      session[:employer_id] = @employer.id
      redirect_to employer_path(@employer)
    else
      render 'new'
    end
  end

  def show
    @your_jobs = []
    @applicantions = []
    for j in JobEmployee.all
      job = Job.find(j.job_id)
      employee = Employee.find(j.employee_id)
      if job.employer.id == @employer.id
        @applicantions.push([job, j.approved, employee])
      end
    end

    for job in Job.where(employer_id: @employer.id)
      @your_jobs.push(job)
    end
  end

  def edit
    
  end

  def update
    if @employer.update(employer_params)
      redirect_to employer_path(@employer)
    else
      render 'edit'
    end
  end

  def destroy
    @employer.destroy
    redirect_to employers_path
  end

  private
  def employer_params
    params.require(:employer).permit(:full_name, :email, :location, :branch, :photo, :password)
  end
  def set_employer
    @employer = Employer.find(params[:id])
  end

end