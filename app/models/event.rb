class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances, source: :user
  validates :location, presence: true
  validates :date, presence: true

  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date > ?", Date.today) }
end
