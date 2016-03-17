class VisitorsController < ApplicationController
  def index
    @showings = Showing.order("time ASC").where(["time > ?", Time.now])
  end
end