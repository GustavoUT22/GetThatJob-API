require 'pry'
class ApplicationsController < ApplicationController
  def index
    binding.pry
   
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
    @application = Application.new(application_params)

    if @application.save
      render json: @application, status: :created
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def update
  end
  def set_job
    @job = current_user.jobs.find(params[:id])
  end

  def application_params
    params.permit(:experience, :why_interested, :job_id, :professional_id)
  end
end
