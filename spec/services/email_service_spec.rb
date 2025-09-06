require 'models/email_client'
require 'services/email_service'

RSpec.describe EmailService do
  let(:email_client) { instance_double(EmailClient) }
  let(:email_service) { EmailService.new(email_client)}

  describe '#send_welcome_email' do
    context 'when email is sent successfully' do
      before do
        allow(email_client).to receive(:send_email).and_return(true)
      end

      it 'calls the email client with correct parameters' do
        email_service.send_welcome_email('dennis@email.com', 'Dennis')

        expect(email_client).to have_received(:send_email).with(
          to: 'dennis@email.com',
          subject: 'Welcome, Dennis!',
          body: "Welcome to our service, Dennis!"
        )
      end

      it 'return success message' do
        result = email_service.send_welcome_email('dennis@email.com', 'Dennis')
        expect(result).to eq('Email sent successfully')
      end
    end
  end
end
