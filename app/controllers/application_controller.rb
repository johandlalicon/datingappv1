class ApplicationController < ActionController::API
  require 'pry'
  require 'json_web_token'

  # before_action :authorize_request


  # private

  # def authorize_request
  #   header = request.headers['Authorization']
  #   if header.present?
  #     header = header.split(' ').last
      
  #     begin
  #       @decoded = JsonWebToken.decode(header)
  #       @current_user = User.find(@decoded[:user_id])
  #     rescue ActiveRecord::RecordNotFound => e
  #       render json: { errors: e.message }, status: :unauthorized
  #     rescue JWT::DecodeError => e
  #       render json: { errors: e.message }, status: :unauthorized
  #     end
  #   else
  #     render json: { errors: 'Authorization header missing' }, status: :unauthorized
  #   end
  # end
  
end
