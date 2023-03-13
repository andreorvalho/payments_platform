class LoginsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      render json: { token: encode(user_id:  @user.id) }
    else
      render json: { errors: 'unauthorized' }, status: :unauthorized
    end
  end
end
