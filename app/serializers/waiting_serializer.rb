class WaitingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :book_id

  belongs_to :user

end
