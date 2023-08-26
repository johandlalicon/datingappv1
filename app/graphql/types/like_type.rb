# frozen_string_literal: true

module Types
  class LikeType < Types::BaseObject
    field :id, ID, null: false
    field :sender_id, UserType
    field :receiver_id, UserType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
