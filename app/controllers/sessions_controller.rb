class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create

  def index; end

  def show; end

  def new; end

  def create
    professional = Professional.find_by(email: params[:email]) # nil || <# User/>
    if professional&.authenticate(params[:password])
       # regenerar el token
      professional.regenerate_token
      render json: { token: professional.token }
    else
      render json: { error: "Incorrect email or password" }, status: :unauthorized
    end
  end

  def update; end

  def destroy
    current_user.invalid_token
  end

end
