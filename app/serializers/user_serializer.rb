class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :username, :bio, :profile_pic, :two_weeks, :waitings, :eligible

  has_many :waitings


end
