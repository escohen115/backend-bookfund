class User < ApplicationRecord
    validates :username, presence: true
    validates_uniqueness_of :username

    has_many :waitings
    has_many :reviews

    has_many :books, through: :received

end
