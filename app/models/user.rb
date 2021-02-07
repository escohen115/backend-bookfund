class User < ApplicationRecord
    validates_uniqueness_of :username
    
    has_many :waitings
    has_many :sponsors
    has_many :reviews
    has_many :receiveds

    has_many :books, through: :received

end
