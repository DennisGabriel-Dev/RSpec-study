class EmailService
  def initialize(email_client)
    @email_client = email_client
  end

  def send_welcome_email(email, name)
    begin
      success = @email_client.send_email(
        to: email,
        subject: "Welcome, #{name}!",
        body: "Welcome to our service, #{name}!"
      )

      success ? "Email sent successfully" : "Failed to send email"
    rescue => e
      "Error #{e.message}"
    end
  end

  def send_batch_emails(email_list, message)
    email_list.each do |email|
      @email_client.send_email(
        to: email,
        subject: "Batch Email",
        body: message
      )
    end
  end
end
