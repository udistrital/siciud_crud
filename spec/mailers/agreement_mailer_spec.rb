require "rails_helper"

RSpec.describe AgreementMailer, type: :mailer do
  describe "sample" do
    let(:mail) { AgreementMailer.sample }

    it "renders the headers" do
      expect(mail.subject).to eq("Sample")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
