class Follow < ApplicationRecord
	belongs_to :follower, class_name: User
	belongs_to :reverse_follower, class_name: User

	validates :follower, presence: true
	validates :reverse_follower, presence: true
	validates :reverse_follower_id, uniqueness: {scope: :follower_id}
	validates :reverse_follower_id, follower_id: false
end
