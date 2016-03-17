class AdminsController < ApplicationController
  def index
    @upcoming_showings = Showing.order("time ASC").where(["time > ?", Time.now])
    @past_showings = Showing.order("time ASC").where(["time < ?", Time.now])
  end
end