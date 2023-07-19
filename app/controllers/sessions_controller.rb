class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create

  def index
  end

  def new
  end

  def show
  end

  def create
     puts params
     professional = Professional.find_by(email: params[:email]) # nil || <# User/>
     if professional&.authenticate(params[:password])

       # regenerar el token
       professional.regenerate_token
       render json: { token: professional.token }
     else
       render json: { error: "Incorrect email or password" }, status: :unauthorized
     end

  end


  def destroy
  end

  def update
  end
end
