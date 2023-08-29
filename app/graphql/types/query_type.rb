module Types
  class QueryType < Types::BaseObject
    require 'pry'
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_users, [UserType], null: false

    def all_users
      User.all
    end

    field :find_match, [UserType], null: true do
      description "Find matching users based on gender and gender interest"
     
    end

    def find_match
      # user = User.find(context[:current_user])
      user = context[:current_user]
      
      return unless user

      user_sent_likes = Like.where(sender_id: user.id)
      users_already_liked = user_sent_likes.pluck(:receiver_id)
      
      User.where(
        gender: user.read_attribute_before_type_cast(:gender_interest), gender_interest: user.read_attribute_before_type_cast(:gender)
      )
      .where.not(id: users_already_liked + [user.id])
    end

  end
end
