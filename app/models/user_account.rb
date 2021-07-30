class UserAccount < ApplicationRecord
  belongs_to :user
  validates :state, presence: true
  STATUSES = [:planned, :male, :female]
end
