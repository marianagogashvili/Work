class UsermailerMailer < ApplicationMailer
  default from: 'work.website.adm1n@gmail.com'

  def approved_email(employee, employer, job)
    @employee = employee
    @employer = employer
    @job = job

    @url  = 'http://www.gmail.com'
    mail(to: @employee.email, subject: 'Job request accepted')
  end
  def disapproved_email(employee, employer, job)
    @employee = employee
    @employer = employer
    @job = job

    mail(to: @employee.email, subject: 'Job request rejected')
  end
end
