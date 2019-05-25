class PagesController < ApplicationController
  before_action :require_user
  protect_from_forgery
  def home
    t = false
    if params[:time] == 'Today'
      time = Time.now.strftime("%Y-%m-%d").to_s
      t = true
    elsif params[:time] == 'Yesterday'
      time = Date.yesterday.strftime("%Y-%m-%d")
      t = true
    elsif params[:time] == 'Last 7 days'
      time = 1.week.ago.strftime("%Y-%m-%d")
    elsif params[:time] == 'Last 14 days'
      time = 2.week.ago.strftime("%Y-%m-%d")
    elsif params[:time] == 'Last month'
      time = 1.month.ago.strftime("%Y-%m-%d")
    end

    if t == true
      @jobs = Job.where("title LIKE ? AND contract_type = ? AND location LIKE ? AND created_at = ?", "%#{params[:name]}%", "#{params[:type]}", "%#{params[:location]}%", "#{time}")
    else
      @jobs = Job.where("title LIKE ? AND contract_type = ? AND location LIKE ? AND created_at >= ?", "%#{params[:name]}%", "#{params[:type]}", "%#{params[:location]}%", "#{time}")
    end

    if params[:job_id] != nil
      @job = Job.find(params[:job_id])
    else
      if @jobs.ids != []
        @job = @jobs.first
      end
    end

  end

  def home2
    @search = params[:search]
    redirect_to controller: 'pages', action: 'home', name: @search[0], location: @search[1], type: @search[2], time: @search[3]
  end

  private
  def require_user
    if !logged_in?
      redirect_to login_path
    end
  end
end