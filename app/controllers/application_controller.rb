class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_user

  private

  def authenticate_user
    @token = decode(http_auth_header)
    render json: { errors: e.message }, status: :unauthorized if Time.now < @token[:exp]
    @current_user = User.find_by_email(@token[:user_id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: e.message }, status: :unauthorized
  rescue JWT::DecodeError => e
    render json: { errors: e.message }, status: :unauthorized
  end

  def http_auth_header
    request.headers['Authorization']&.split(' ')&.last
  end
end

