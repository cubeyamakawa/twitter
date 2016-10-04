class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :tweets
  has_many :favorites

  has_many :follows, foreign_key: :follower_id
  has_many :reverse_followers, through: :follows
  has_many :reverse_follows, foreign_key: :reverse_follower_id, class_name: Follow
  has_many :followers, through: :reverse_follows

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..24 }
  validates :displayname, length: { maximum: 140 }
  validates :prof, length: { maximum: 200  }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { in: 6..24 }, if: :password
  validates :password_confirmation, presence: true, if: :password

  def followed_by? user
  	reverse_follows.where(follower_id: user.id).exists?
  end
end
