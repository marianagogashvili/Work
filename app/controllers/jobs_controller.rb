class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
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
    params.require(:job).permit(:title, :description, :contract_type, :vacant)
  end
  def set_job
    
  end
end