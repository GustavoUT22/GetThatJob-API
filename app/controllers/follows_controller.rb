class FollowsController < ApplicationController
  def index
    @follows = current_user.follows.all
    render json: @follows
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end

  def update
  end
end
