class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session
  # require 'json_web_token'
  require 'pry'

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      session: session,
      current_user: current_user
    }
    result = DatingAppV1Schema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # gets current user from token stored in the session
  def current_user
    
    authorization_header = request.headers['Authorization']
    if authorization_header.present?
      
      token = authorization_header.split(' ').last
      
        decoded_token = JsonWebToken.decode(token)
        
        user_id = decoded_token[0]
        
        user = User.find_by(id: user_id[0]["user_id"])  
        
        user
        
      # rescue JWT::DecodeError, JWT::ExpiredSignature
      #   nil
      # end
    elsif session[:token] 
        
        decoded_token = JsonWebToken.decode(session[:token])
        
        user_id = decoded_token[0]
        
        user = User.find_by(id: user_id[0]["user_id"])  
        
        user
    else
      nil
    end
      
  end
  

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
