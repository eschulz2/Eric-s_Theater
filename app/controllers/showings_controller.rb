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

end