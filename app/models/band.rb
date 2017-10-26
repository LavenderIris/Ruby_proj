class Band < ApplicationRecord
    has_many :concerts
    has_many :users
    has_many :wish
    has_many :user_wishes, through: :wish, source: :user

    validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
end
