class RecruitersController < ApplicationController
  skip_before_action :authorize, only: :create
  def index
   
  end
  def show
    # @current_user = current_user.joins(:company_logo)
    # render json: @current_user.as_json(only: %i[name]).merge(
    #   company_path: url_for(@current_user.company_logo))
    render json: current_user
  end

  def new
    @recruiter = Recruiter.new
  end


  def create
    @recruiter = Recruiter.new(recruiter_params)
   
    if @recruiter.save
      render json: @recruiter, status: :created # 201
    else
      render json: { errors: @recruiter.errors }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def update
    if current_user.update(recruiter_params)
      render json: current_user
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def recruiter_params
    params.permit(:email, :password, :company_name, :company_website, :company_about)
  end
end
