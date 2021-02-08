class WaitingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :book_id, :fulfilled, :sponsor_id, :created_at

  belongs_to :user

end
