class PagesController < ApplicationController
  before_action :require_user
  protect_from_forgery
  def home
    distance_of_time_in_words(Time.current() - t.created_at)
    @jobs = Job.where("title LIKE ? AND contract_type LIKE ? AND location LIKE ? AND created_at ?", "%#{params[:name]}%", "%#{params[:type]}%", "%#{params[:location]}%", "%#{params[:time]}%")
  end
  def home2
    @search = params[:search]
    #time
    redirect_to controller: 'pages', action: 'home', name: @search[0], type: @search[1], location: @search[2], time: @search[3]
  end

  private
  def require_user
    if !logged_in?
      redirect_to login_path
    end
  end
end