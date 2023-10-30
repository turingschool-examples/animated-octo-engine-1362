class StudiosController < ApplicationController
  def index
    @studios = Studio.includes(:movies)
  end
end