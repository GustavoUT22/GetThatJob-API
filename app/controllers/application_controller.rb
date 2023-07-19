class ApplicationController < ActionController::API 

  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authorize

  def authorize
    return if authenticate_token

    respond_unauthorized("Access Denied")
  end

  def respond_unauthorized(message)
    render json: { error: message }, status: :unauthorized
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      Professional.find_by(token: token) # <# User > || nil
    end
  end

end
