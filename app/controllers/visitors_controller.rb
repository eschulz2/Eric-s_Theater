class VisitorsController < ApplicationController
  def index
    @showings = Showing.where(["time > ?", Time.now])
  end
end