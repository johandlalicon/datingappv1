module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_users, [UserType], null: false

    def all_users
      User.all
    end

    field :find_match, [UserType], null: true do
      description "Find matching users based on gender and gender interest"
      argument :user_id, ID, required: true
    end

    def find_match(user_id:)
      user = User.find(user_id)
      User.where(
        gender: user.read_attribute_before_type_cast(:gender_interest), gender_interest: user.read_attribute_before_type_cast(:gender)
      )
    
    end

  end
end
