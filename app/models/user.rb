class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :tweets
  has_many :favorites

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..24 }
  validates :displayname, length: { maximum: 140 }
  validates :prof, length: { maximum: 200  }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { in: 6..24 }, if: :password
  validates :password_confirmation, presence: true, if: :password

end
