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
  def registered_email(employee)
    @employee = employee
    @url = 'localhost:3000/employees/' + employee.id.to_s
    mail(to: @employee.email, subject: 'Registered at Work.com')
  end
  def registered_email2(employer)
    @employer = employer
    @url = 'localhost:3000/employers/' + employer.id.to_s
    mail(to: @employer.email, subject: 'Registered at Work.com')
  end
end
