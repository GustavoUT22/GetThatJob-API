class FollowsController < ApplicationController
  def index
    follows = current_user.follows.all
    @follows = follows.map do |follow|
      {
        id: follow.id,
		    created_at: follow.created_at,
		    updated_at: follow.updated_at,
		    professional_id: follow.professional_id,
		    followable_type: follow.followable_type,
		    followable_id: follow.followable_id,
        logo: follow.followable_type === "Job"? Job.all.where(id: follow.followable_id)[0].recruiter_id : "logo"
      }
    end
    render json: @follows
  end

  def new
  end

  def show
  end

  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      render json: @follow, status: :created # 201
    else
      render json: { errors: @follow.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @follow = Follow.find_by(id: params[:id])
    if  @follow.destroy
      render json: { message: 'Follow successfully deleted.' }, status: :ok
    else
      render json: { error: 'You are not authorized to delete this application.' }, status: :unauthorized
    end
  end

  def update
  end

  def follow_params
    params.permit(:professional_id,
                  :followable_type,
                  :followable_id)
  end
end
