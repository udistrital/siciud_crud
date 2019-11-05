class AgreementMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agreement_mailer.sample.subject
  #
  def sample(activity)
    @greeting = activity
    mail to: "siciud-cidc@correo.udistrital.edu.co"
  end
end
