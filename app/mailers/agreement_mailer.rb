class AgreementMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agreement_mailer.sample.subject
  #
  def sample
    @greeting = "Hi"

    mail to: "joranboc@gmail.com"
  end
end
