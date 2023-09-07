# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode({ user_id: @user.id })
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def login_params
    params.permit(:email, :password)
  end
end
