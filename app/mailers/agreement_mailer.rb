class AgreementMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agreement_mailer.sample.subject
  #
  def sample(researcher,activity)
    @greeting = activity
    mail(to: researcher.academic_email, subject: 'El investigador ha subido un nuevo progreso en el proyecto '+ @greeting.agreement_research_project.name )
  end
end
