module Mutations
  class SignInUser < BaseMutation
    require 'json_web_token'
    null true

    argument :credentials, Types::AuthProviderCredentialsInputType, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :admin, Boolean, null: true

    def resolve(credentials: nil)
      
      return unless credentials

      user = User.find_by email: credentials[:email]
      
      unless user && user.authenticate(credentials[:password])
     
        raise GraphQL::ExecutionError, 'Invalid username or password'
      end

      token = JsonWebToken.encode(user_id: user.id)

      context[:session][:token] = token
      
      { user: user, token: token, admin: user.isAdmin?  }
      
    end
  end
end
