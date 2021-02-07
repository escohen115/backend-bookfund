class Book < ApplicationRecord
    validates_uniqueness_of :api_id

    has_many :reviews
    has_many :waitings
    has_many :sponsors
    has_many :receiveds

    has_many :users, through: :receiveds

    accepts_nested_attributes_for :waitings
end
