class RecsessionsController < ApplicationController
  skip_before_action :authorize, only: :create
  def index
  end

  def new
  end

  def show
  end

  def create
    recruiter = Recruiter.find_by(email: params[:email]) # nil || <# User/>
    if recruiter&.authenticate(params[:password])
       # regenerar el token
      recruiter.regenerate_token
      render json: { token: recruiter.token }
    else
      render json: { error: "Incorrect email or password" }, status: :unauthorized
    end
  end

  def edit
  end

  def update
  end

  def destroy
    current_user.invalid_token
  end
end
