class ProfessionalsController < ApplicationController
  skip_before_action :authorize, only: :create
  
  def index; end

  def show
    render json: current_user
  end

  def new
  #  @professional = Professional.new
  end

  def create
    # @professional = Professional.new(professional_params)

    # if @department.save
    #   redirect_to professional_path, notice: "Department was successfully created."
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def professional_params
    params.permit(:email, :password, :token)
  end

  def update; end

  def destroy; end

end
