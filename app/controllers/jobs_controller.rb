class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_employer, only: [:new, :create]
  before_action :require_employer, only: [:edit, :update, :destroy]
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    @job.employer = Employer.find(session[:employer_id])
    @job.created_at = Time.now
    
    if @job.save
      redirect_to job_path(@job)
    else
      print(@job.errors.full_messages)
      render 'new'
    end
  end
  def show
    
  end
  def edit
    
  end
  def update
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render 'edit'
    end
  end
  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :contract_type, :vacant, :employer_id)
  end
  def set_job
    @job = Job.find(params[:id])
  end
  def require_logged_employer
    if !logged_in? || session[:employer_id] == nil
      redirect_to root_path
    end
  end
  def require_employer
    if !logged_in && session[:employer_id] != @job.employer
      redirect_to root_path
    end
  end
end