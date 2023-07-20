require 'pry'
class ApplicationsController < ApplicationController
  def index
    binding.pry
    if current_user.company_name?
      @jobs = current_name.jobs
      render json: @jobs
    else
      
    end
    @jobs = Job.all

    render json: @jobs
  end

  def new
  end

  def show
    @job = current_user.jobs.find(params[:id])
    @apps = @job.applications
    render json: @apps
  end

  def create
  end

  def destroy
  end

  def update
  end
  def set_job
    @job = current_user.jobs.find(params[:id])
  end
end
