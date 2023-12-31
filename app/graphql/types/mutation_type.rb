module Types
  class MutationType < Types::BaseObject
    field :send_like, mutation: Mutations::SendLike
    field :sign_out_user, mutation: Mutations::SignOutUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :create_user, mutation: Mutations::CreateUser
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
