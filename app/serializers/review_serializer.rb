class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :book_id, :text, :rating, :user

#   belongs_to :user
#   belongs_to :book

  def user
    ActiveModel::SerializableResource.new(object.user,  each_serializer: UserSerializer)
  end


end
