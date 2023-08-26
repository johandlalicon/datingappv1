module Mutations
  class CreateUser < BaseMutation
    
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInputType, required: false
    end
    
    argument :first_name, String, required: true 
    argument :last_name, String, required: true
    argument :mobile_number, Integer, required: true
    argument :birthdate, GraphQL::Types::ISO8601Date, required: true
    argument :gender, Integer, required: true
    argument :location_country, String, required: true
    argument :location_city, String, required: true
    argument :location_state, String, required: true
    argument :school, String, required: false
    argument :bio, String, required: true
    argument :gender_interest, Integer, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::UserType

    def resolve(**args)
      User.create!(
        email: args[:auth_provider]&.[](:credentials)&.[](:email),
        password: args[:auth_provider]&.[](:credentials)&.[](:password),
        first_name: args[:first_name],
        last_name: args[:last_name],
        mobile_number: args[:mobile_number],
        birthdate: args[:birthdate],
        gender: args[:gender],
        location_country: args[:location_country],
        location_city: args[:location_city],
        location_state: args[:location_state],
        school: args[:school],
        bio: args[:bio],
        gender_interest: args[:gender_interest]
      )
    end
  end
end
