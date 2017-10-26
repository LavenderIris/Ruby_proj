class Concert < ApplicationRecord
  belongs_to :band
  belongs_to :user
  has_many :attendee, through: :attend, source: :user

  validates :venue, :date, :city, :state, :band, presence: true
end
