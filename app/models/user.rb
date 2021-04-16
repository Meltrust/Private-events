class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { in: 4..12 }

  has_many :events, class_name: 'Event', inverse_of: :creator
#   has_many :attended_events, through: :enrollments, source: :event
end
