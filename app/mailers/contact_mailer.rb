class ContactMailer < ActionMailer::Base
  default to: 'rinne1989@hotmail.com'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    mail(form: email, subject: 'Contact From Message')
  end
end