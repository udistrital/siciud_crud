class AgreementMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agreement_mailer.sample.subject
  #
  def new_activity_report(academic, activity)
    @activity = activity
    mail(to: academic.academic_email, subject: 'El investigador ha subido un nuevo progreso en el proyecto ' + @activity.agreement_research_project.name)
  end

  def activity_review(researcher, activity, status)
    case status
    when "inReview"
      @status = "En revision"
    when "rejected"
      @status = "rechazado"
    when "approved"
      @status = "aprovado"
    end


    @activity = activity
    mail(to: researcher, subject: 'El gestor academico ha evaluado el progreso de su proyecto ' + @activity.agreement_research_project.name)
  end
end
