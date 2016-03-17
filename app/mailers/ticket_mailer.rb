class TicketMailer < ApplicationMailer
	default from: "receipt@movietheater.com"

	def receipt(ticket)
    @ticket = ticket
    @showing = @ticket.showing
    mail(to: @ticket.email, subject: "Receipt for #{@showing.title}")
  end
end
