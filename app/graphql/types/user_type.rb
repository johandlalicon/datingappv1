# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :last_name, String
    field :mobile_number, String
    field :email, String
    field :birthdate, GraphQL::Types::ISO8601Date
    field :gender, Integer
    field :location_country, String
    field :location_state, String
    field :location_city, String
    field :school, String
    field :bio, String
    field :gender_interest, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :password_digest, String
  end
end
