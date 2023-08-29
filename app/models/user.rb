class User < ApplicationRecord
    has_secure_password

    enum gender: { male_gender: 0, female_gender: 1}
    enum gender_interest: { male_interest: 0, female_interest: 1}

    validates :first_name, :last_name, :email, :birthdate, :gender, :location_country, :location_state, :location_city, :gender_interest, presence: true
    validates :email, uniqueness: true

    has_many :sent_likes, class_name: 'Like', foreign_key: 'sender_id'
    has_many :received_likes, class_name: 'Like', foreign_key: 'receiver_id'


end
