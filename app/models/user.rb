class User < ApplicationRecord
  validates :username, presence: true, length: { in: 4..12 }

  has_many :events, inverse_of: :creator
  has_many :enrollments
  has_many :attended_events, through: :enrollments, source: :event
end
