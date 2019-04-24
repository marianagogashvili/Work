class SessionsController < ApplicationController

  def new
    
  end
  def create
    employee = Employee.find_by(email: params[:session][:email].downcase)
    if employee
      if employee && employee.authenticate(params[:session][:password])
        session[:employee_id] = employee.id
        redirect_to employee_path(employee)
      else
        render 'new'
      end
    else
      employer = Employer.find_by(email: params[:session][:email].downcase)
      if employer && employer.authenticate(params[:session][:password])
        session[:employer_id] = employer.id
        redirect_to employer_path(employer)
      else
        render 'new'
      end
    end
  end
  def destroy
    session[:employee_id] = nil
    session[:employer_id] = nil
    redirect_to login_path
  end

end