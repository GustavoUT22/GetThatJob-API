class RecruitersController < ApplicationController
  skip_before_action :authorize, only: :create
  def index
  end

  def new
  end

  def show
    render json: current_user
  end

  def create
  end

  def destroy
  end

  def update
  end

  def professional_params
    params.permit(:email, :password, :token)
  end
end
