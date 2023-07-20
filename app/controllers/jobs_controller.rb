class JobsController < ApplicationController
  # GET jobs
  def index
    @jobs = Job.all

    render json: @jobs
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end

  def update
  end
end
