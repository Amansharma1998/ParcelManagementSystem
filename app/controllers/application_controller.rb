# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # include JwtToken
  # before_action :authenticate_user
  # # before_action do
  # #   ActiveStorage::Current.host = request.base_url
  # # end

  # private

  # def authenticate_user
  #   header = request.headers['Authorization']
  #   header = header.split(' ').last if header
  #   begin
  #     @decoded = jwt_decode(header)
  #     @current_user = User.find(@decoded[:user_id])
  #   rescue ActiveRecord::RecordNotFound => e
  #     render json: { errors: e.message }, status: :unauthorized
  #   rescue JWT::DecodeError => e
  #     render json: { errors: e.message }, status: :unauthorized
  #   end
  # end
end
