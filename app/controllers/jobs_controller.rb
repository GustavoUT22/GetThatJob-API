
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
    jobs = Job.all.map do |job|
      {
        id: job.id,
        title: job.title,
        category: job.category,
        job_type: job.job_type,
        salary: job.salary,
        mandatory: job.mandatory,
        optional_req: job.optional_req,
        about: job.about,
        applications_count: job.applications_count,
        created_at: job.created_at,
        updated_at: job.updated_at,
        # Otros atributos del job
        company_name: job.recruiter&.company_name # Usamos el operador &. para evitar errores si no hay recruiter asociado
      }
    end

    recruiter_jobs = current_user.jobs.map do |job| 
      {
        id: job.id,
        title: job.title,
        category: job.category,
        job_type: job.job_type,
        salary: job.salary,
        mandatory: job.mandatory,
        optional_req: job.optional_req,
        about: job.about,
        applications_count: job.applications_count,
        created_at: job.created_at,
        updated_at: job.updated_at,
        # Otros atributos del job
        applications: job.applications.map do |apply|
          {
            id: apply.id,
            professional: apply.professional,
            job: apply.job,
            company_name: apply.job.recruiter.company_name,
            experience: apply.experience,
            why_interested: apply.why_interested,
            created_at: apply.created_at,
            updated_at: apply.updated_at,
            status: apply.status
          }
        end
      }
    end
    @jobs = table_name == "recruiters" ? recruiter_jobs : jobs
    render json: @jobs
  end

  def new
  end

  def show
    job = Job.all.find(params[:id])
    @job = {
      id: job.id,
      title: job.title,
      category: job.category,
      job_type: job.job_type,
      salary: job.salary,
      mandatory: job.mandatory,
      optional_req: job.optional_req,
      about: job.about,
      applications_count: job.applications_count,
      created_at: job.created_at,
      updated_at: job.updated_at,
      # Otros atributos del job
      company_name: job.recruiter&.company_name # Usamos el operador &. para evitar errores si no hay recruiter asociado
    }
    # @apps = @job.applications
    render json: @job
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created # 201
    else
      render json: { errors: @job.errors }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def update
    
  end
  def job_params
    params.permit(:recruiter_id, :title, :category, :job_type, :salary, :mandatory, :optional_req, :about)
  end
end
