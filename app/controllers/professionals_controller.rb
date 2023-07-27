require "pry"

class ProfessionalsController < ApplicationController
  skip_before_action :authorize, only: :create
  
  def index; 
  end

  def show
    render json: current_user
  end

  def new
   @professional = Professional.new
  end

  def create
    @professional = Professional.new(professional_params)
    #recruiter_account.company_logo.attach(io: File.open(img_path), filename: img)
    @professional.resume.attach(filename: professional_params.resume)
    if @professional.save
      render json: @professional, status: :created # 201
    else
      render json: { errors: @professional.errors }, status: :unprocessable_entity
    end
  end

  def update
    # permitted_params = professional_params.merge(resume: params[:professional][:resume])
    # binding.pry
    params[:resume]? current_user.resume.attach(params[:resume]):[]
    data = professional_params.except("resume")
    if current_user.update(data)
      render json: current_user, status: :ok
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy; end

  def professional_params
    params.permit(:email,
                  :password,
                  :name,
                  :birth_date,
                  :linkedin,
                  :phone,
                  :professional_title,
                  :experience,
                  :education,
                  :resume, :token)
  end
end
