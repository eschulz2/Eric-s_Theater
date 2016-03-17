class AdminsController < ApplicationController
  def index
    @upcoming_showings = Showing.where(["time > ?", Time.now])
    @past_showings = Showing.where(["time < ?", Time.now])
  end
end