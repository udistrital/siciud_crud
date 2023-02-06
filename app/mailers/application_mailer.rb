class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_FROM']
end
