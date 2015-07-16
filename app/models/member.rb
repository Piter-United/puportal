class Member < ActiveRecord::Base
  belongs_to :user,      class_name: "User",      inverse_of: :members
  belongs_to :community, class_name: "Community", inverse_of: :members

  validates :community_id, presence: true
  validates :user_id, presence: true, uniqueness: { with: true, scope: [:community_id] }
end
