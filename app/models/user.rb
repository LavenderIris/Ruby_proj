class User < ApplicationRecord
    has_secure_password

    has_many :concerts
    has_many :bands
    has_many :attend
    has_many :wish
    has_many :concert_attended, through: :attend, source: :concerts
    has_many :band_wishes, through: :wish, source: :band
    has_many :friendships, foreign_key: :user_id, class_name: :Friendship
    has_many :friends, through: :friendships

    validates :first_name, :last_name, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_uniqueness_of :email, presence: true

    def email= email
      super(email.try(:downcase))
    end

    validates :password, length: {in: 8..30}, on: :create
end
