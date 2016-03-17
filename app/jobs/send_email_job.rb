class SendEmailJob < ActiveJob::Base
  queue_as :default

	def receipt(ticket)
    @ticket = ticket
    @showing = @ticket.showing
    mail(to: @ticket.email, subject: "Receipt for #{@showing.title}")
  end
end
