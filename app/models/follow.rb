class Follow < ApplicationRecord
	belongs_to :follower, class_name: User
	belongs_to :reverse_follower, class_name: User
end
