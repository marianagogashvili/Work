class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_employee, :current_employer, :logged_in?, :check?

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
  def current_employer
    @current_employer ||= Employer.find(session[:employer_id]) if session[:employer_id]
  end

  def logged_in?
    !!current_employer || !!current_employee  #convert into boolean
  end

  def check?
    JobEmployee.find_by(job_id: params[:id], employee_id: session[:employee_id]) != nil
  end

  def require_user
    if !logged_in?
      redirect_to redirect_to(:back)
    end
  end
end
