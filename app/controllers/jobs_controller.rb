class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :save]
  before_action :require_logged_employer, only: [:new, :create]
  before_action :require_employer, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => :search
  before_action :find_saved, only: [:save, :show]

  def index
   
  end


  def save
    s = Saved.new(employee_id: session[:employee_id], job_id: @job.id)
    if !@valid
      if s.save
        redirect_to employee_path(session[:employee_id])
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def del_save
    s = Saved.find_by(job_id: params[:id], employee_id: session[:employee_id])
    s.destroy
    redirect_to employee_path(session[:employee_id])
  end

  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    @job.employer = Employer.find(session[:employer_id])
    @job.created_at = Time.now.strftime("%Y-%m-%d")
    
    if @job.save
      redirect_to job_path(@job)
    else
      render 'new'
    end
  end
  def show
    print(Date.current())
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
  def find_saved
    @valid = Saved.find_by(job_id: @job.id, employee_id: session[:employee_id])
  end
  def job_params
    params.require(:job).permit(:title, :description, :contract_type, :vacant, :location, :photo, :employer_id)
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
    if logged_in?
      if session[:employer_id] != @job.employer_id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
    
  end
end