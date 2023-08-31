class MutualLike < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :match, class_name: "User"
end
