class EmployersController < ApplicationController
  before_action :set_employer, only: [:edit, :update, :show, :destroy]
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      redirect_to employer_path(@employer)
    else
      render 'new'
    end
  end

  def show
    
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
    params.require(:employer).permit(:name, :email, :location, :branch)
  end
  def set_employer
    @employer = Employer.find(params[:id])
  end

end