module Mutations
  class SignInUser < BaseMutation
    require 'json_web_token'
    null true

    argument :credentials, Types::AuthProviderCredentialsInputType, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)

      if context[:current_user].present?
        raise GraphQL::ExecutionError, 'You are already signed in'
      end

      return unless credentials

      user = User.find_by email: credentials[:email]
      
      unless user && user.authenticate(credentials[:password])
     
        raise GraphQL::ExecutionError, 'Invalid username or password'
      end
      token = JsonWebToken.encode(user_id: user.id)

      context[:session][:token] = token
      
      { user: user, token: token }
    end
  end
end
