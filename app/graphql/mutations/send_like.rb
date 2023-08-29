module Mutations
  class SendLike < BaseMutation
    require 'pry'
    field :success, Boolean, null: false
    field :errors, [String], null: true

    argument :user_id, ID, required: true 

    def resolve(user_id:)

      sender = context[:current_user]
      receiver = User.find_by(id: user_id)

      Like.create(sender_id: sender.id, receiver_id: user_id)

      like = Like.new(sender_id: sender.id, receiver_id: user_id)
      
      if like.save
        { success: true, errors: nil }
      else
        { success: false, errors: like.errors.full_messages }
      end

    end
  end
end
