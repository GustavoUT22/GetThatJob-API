class RecruitersController < ApplicationController
  skip_before_action :authorize, only: :create
  def index
  end
  def show
    @current_user = current_user.joins(:company_logo)
    render json: @current_user.as_json(only: %i[name]).merge(
      company_path: url_for(@current_user.company_logo))
  end

  def new
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
