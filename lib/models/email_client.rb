class EmailClient
  def send_email(options = {})
    puts "Send email to #{options[:to]}"
    puts "Subject: #{options[:subject]}"
    puts "Body: #{options[:body]}"
  end
end
