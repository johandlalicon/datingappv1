class Like < ApplicationRecord
  require 'pry'
  after_create :create_mutual_like

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  def create_mutual_like
    user_sent_likes = Like.where(sender_id: sender_id)
    mutual_likes = user_sent_likes.where(receiver_id: receiver_id)
    if mutual_likes.present?
      MutualLike.create(owner_id: sender_id, match_id: receiver_id)
    end
  
  end

end
