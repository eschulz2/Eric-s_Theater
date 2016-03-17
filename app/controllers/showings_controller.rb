class ShowingsController < ApplicationController
  def index
  end

  def new
  	@showing = Showing.new
  end

  def create
  	@showing = Showing.create(showing_params)

  	if @showing.save
  		redirect_to @showing
  	else
  		flash[:alert] = "Failed to Create!!"
  		redirect_to :back
  	end
  end

  def show
  	@showing = Showing.find(params[:id])
  	@ticket = Ticket.new
  end

  def make_ticket
  	@ticket = Ticket.new(ticket_params)

  	if @ticket.save
  		showing = @ticket.showing
  		showing.seat_count -= 1
  		showing.save
  		TicketMailer.receipt(@ticket).deliver_now
  		flash[:notice] = "Ticket Purchased!"
  		redirect_to :root
  	else
  		flash[:alert] = "Please Provide Proper Name, Email, and Credit Card Info"
  		redirect_to :back
  	end
  end

  def edit
  	@showing = Showing.find(params[:id])
  end

  def update
  	@showing = Showing.find(params[:id])

  	if @showing.update(showing_params)
  		redirect_to @showing
  	else
  		flash[:alert] = "Failed to Update!!"
			redirect_to @showing
		end
  end

  private

	def showing_params
	  params.require(:showing).permit(:title, :time, :seat_count, :auditorium)
	end

	def ticket_params
	  params.require(:ticket).permit(:name, :email, :cc_num, :cc_exp, :showing_id)
	end

end