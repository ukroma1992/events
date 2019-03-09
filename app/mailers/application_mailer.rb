class ApplicationMailer < ActionMailer::Base
  default from: 'mail@events-rails.herokuapp.com'
  layout 'mailer'
end
