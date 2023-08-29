module Mutations
  class SignOutUser < BaseMutation
    null true

    field :success, Boolean, null: false
    field :current_user, Types::UserType, null: true
    
    def resolve
      context[:session] = "test"
      context[:current_user] = nil
      
      { success: true }
    end
  end
end
