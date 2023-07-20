
require 'pry'
class JobsController < ApplicationController
  # GET jobs
  def index
    # binding.pry
    # if current_user.class.table_name == "recruiters"
    #   @jobs = current_user.jobs
    #   render json: @jobs
    #   return
    # end
    # if current_user.class.table_name == "professionals"
    #   @jobs = Job.all
    #   render json: @jobs
    #   return
    # end
    table_name = current_user.class.table_name
    @jobs = table_name == "recruiters" ? current_user.jobs : Job.all
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
