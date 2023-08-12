
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
    follow = table_name == "professionals" ? current_user.follows.where(followable_type: "Job") : []
    followed_job_ids = table_name == "professionals" ? follow.map { |follow| follow.followable_id } : []
    jobs = Job.all.map do |job|
      {
        id: job.id,
        company_name: job.recruiter&.company_name,
        company_logo: rails_blob_url(job.recruiter.company_logo), # Usamos el operador &. para evitar errores si no hay recruiter asociado
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
        follow: followed_job_ids.include?(job.id),
        job_status: job.job_status
        # follow_id: followed_job_ids.include?(job.id) ? followed_job_ids.where(id: job.id ).id : nil
        # Otros atributos del job
      }
    end

    recruiter_jobs = table_name == "recruiters" ? current_user.jobs.map do |job| 
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
        job_status: job.job_status,
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
    end : []
    @jobs = table_name == "recruiters" ? recruiter_jobs : jobs
    render json: @jobs
  end

  def new
  end

  def show
    jobs = Job.all.find(params[:id])
    
    # @job = job.attributes.merge(applications: job.applications)
  #  work = jobs.attributes.merge(applications: jobs.applications.map do |apply|
  #     {
  #       id: apply.id,
  #       professional: apply.professional,
  #       job: apply.job,
  #       company_name: apply.job.recruiter.company_name,
  #       experience: apply.experience,
  #       why_interested: apply.why_interested,
  #       created_at: apply.created_at,
  #       updated_at: apply.updated_at,
  #       status: apply.status
  #     }
  #   end)

    job = {
      id: jobs["id"],
      title: jobs["title"],
      category: jobs["category"],
      job_type: jobs["job_type"],
      salary: jobs["salary"],
      mandatory: jobs["mandatory"],
      optional_req: jobs["optional_req"],
      recruiter_id: jobs["recruiter_id"],
      about: jobs["about"],
      created_at: jobs["created_at"],
      company_name: jobs.recruiter.company_name,
      applications_count: jobs["applications_count"],
      applications: jobs.applications.map do |apply|
        {
          id: apply.id,
          professional: apply.professional,
          job: apply.job,
          company_name: apply.job.recruiter.company_name,
          experience: apply.experience,
          why_interested: apply.why_interested,
          created_at: apply.created_at,
          updated_at: apply.updated_at,
          status: apply.status,
          cv: rails_blob_url(apply.cv)
        }
      end
    }

    render json: job
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job, status: :created # 201
    else
      render json: { errors: @job.errors }, status: :unprocessable_entity
    end
  end

  def update
    @job = Job.all.find(params[:id])

    if @job.update(job_params)
      render json: @job, status: :ok
    else
      render json: { errors: @job.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find_by(id: params[:id])
    if @job.destroy
      render json: { message: 'Job successfully deleted.' }, status: :ok
    else
      render json: { error: 'You are not authorized to delete this job.' }, status: :unauthorized
    end
  end

  def job_params
    params.permit(:recruiter_id, :title, :category, :job_type, :mandatory, :optional_req, :job_status, :about,salary: [])
  end
end
