# Preview all emails at http://localhost:3000/rails/mailers/agreement_mailer
class AgreementMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/agreement_mailer/sample
  def sample
    AgreementMailer.sample
  end

end
